using System.Net;
using System.Text;
using Server.Services;

namespace Server.Core;

public class HttpServer
{
    private readonly HttpListener _listener = new();
    private readonly MinerService _minerService;
    private readonly PlayerService _playerService;
    private readonly PlayerSyncService _syncService;

    public HttpServer(
        PlayerService playerService,
        PlayerSyncService syncService,
        MinerService minerService)
    {
        _playerService = playerService;
        _syncService = syncService;
        _minerService = minerService;
    }

    public void Start()
    {
        _listener.Prefixes.Add(
            ServerConfig.Address
        );

        _listener.Start();

        ServerLogger.Info(
            $"HTTP listening on {ServerConfig.Address}"
        );

        Task.Run(ListenLoop);
    }

    private async Task ListenLoop()
    {
        while (_listener.IsListening)
        {
            var context =
                await _listener.GetContextAsync();

            _ = Task.Run(() => HandleRequest(context)
            );
        }
    }

    private async Task HandleRequest(
        HttpListenerContext context)
    {
        if (context.Request.Url!.AbsolutePath
            == "/crossdomain.xml")
        {
            await SendCrossDomain(context);

            return;
        }

        using var reader =
            new StreamReader(
                context.Request.InputStream,
                Encoding.UTF8
            );

        string body =
            await reader.ReadToEndAsync();

        ServerLogger.Info(
            $"Packet received: {body}"
        );

        string response =
            await PacketRouter.Route(
                body,
                _playerService,
                _syncService,
                _minerService
            );

        byte[] data =
            Encoding.UTF8.GetBytes(response);

        context.Response.ContentType =
            "application/json";

        context.Response.ContentLength64 =
            data.Length;

        await context.Response.OutputStream.WriteAsync(
            data
        );

        context.Response.Close();
    }

    private async Task SendCrossDomain(
        HttpListenerContext context)
    {
        string policy =
            File.ReadAllText(
                "crossdomain.xml"
            );

        byte[] data =
            Encoding.UTF8.GetBytes(
                policy
            );


        context.Response.ContentType =
            "text/xml";


        context.Response.ContentLength64 =
            data.Length;


        await context.Response.OutputStream
            .WriteAsync(data);


        context.Response.Close();
    }
}