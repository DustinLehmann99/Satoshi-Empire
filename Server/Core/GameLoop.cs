using Server.Services;

namespace Server.Core;

public class GameLoop
{
    private readonly MiningService _miningService;

    private bool _running;


    public GameLoop(
        MiningService miningService)
    {
        _miningService = miningService;
    }


    public void Start()
    {
        _running = true;

        Task.Run(Run);
    }


    private async Task Run()
    {
        ServerLogger.Info(
            "Game loop started."
        );


        while (_running)
        {
            await Tick();

            await Task.Delay(
                TimeSpan.FromSeconds(1)
            );
        }
    }


    private async Task Tick()
    {
        await _miningService.Update();
    }
}