using System.Text.Json;
using Server.Models;
using Server.Packets;
using Server.Services;

namespace Server.Core;

public static class PacketRouter
{
    public static async Task<string> Route(
            string json,
            PlayerService playerService,
            PlayerSyncService syncService,
            MinerService minerService)
    {
        try
        {
            var packet = JsonSerializer.Deserialize<Packet>(json);

            if (packet == null)
            {
                return Error("Invalid packet");
            }


            return packet.Type switch
            {
                "Handshake" =>
                    HandleHandshake(json),
                
                "Login" =>
                    await HandleLogin(
                        json,
                        playerService
                    ),

                "ServerStatus" =>
                    HandleServerStatus(),

                "PlayerStatus" =>
                    HandlePlayerStatus(
                        json,
                        playerService
                    ),

                "PlayerSync" =>
                    HandlePlayerSync(
                        json,
                        syncService
                    ),
                
                "BuyMiner" =>
                    await HandleBuyMiner(
                        json,
                        playerService,
                        minerService
                    ),

                "Ping" =>
                    HandlePing(json),

                _ => Error(
                    $"Unknown packet: {packet.Type}"
                )
            };
        }
        catch (Exception ex)
        {
            return Error(ex.Message);
        }
    }
    
    private static string HandleHandshake(
        string json)
    {
        return JsonSerializer.Serialize(
            new
            {
                Type = "HandshakeResponse",
    
                Version =
                    ServerConfig.Version
            },
            new JsonSerializerOptions
            {
                WriteIndented = true
            }
        );
    }

    private static async Task<string> HandleLogin(string json, PlayerService playerService)
    {
        var login =
            JsonSerializer.Deserialize<LoginPacket>(
                json
            );

        if(!VersionValidator.Valid(login!.Version))
        {
            return Error(
                $"Client version {login.Version} is incompatible. Server requires {ServerConfig.Version}"
            );
        }
        
        SessionManager.Authenticate(
            login.PlayerId
        );
        
        var player =
            await playerService.GetOrCreate(
                login!.PlayerId
            );


        return JsonSerializer.Serialize(
            new
            {
                Type = "LoginResponse",

                Player = player
            },
            new JsonSerializerOptions
            {
                WriteIndented = true
            }
        );
    }

    private static string HandleServerStatus()
    {
        return JsonSerializer.Serialize(
            new
            {
                Type = "ServerStatus",

                Players =
                    ServerState.ConnectedPlayers,

                Version =
                    ServerConfig.Version,

                ServerTime =
                    DateTime.UtcNow,

                Uptime =
                    DateTime.UtcNow -
                    ServerState.StartedAt
            },
            new JsonSerializerOptions
            {
                WriteIndented = true
            }
        );
    }

    private static string HandlePlayerStatus(string json, PlayerService playerService)
    {
        var packet =
            JsonSerializer.Deserialize<PlayerStatusPacket>(
                json
            );

        if(!SessionManager.IsAuthenticated(
               packet!.PlayerId))
        {
            return Error(
                "Player is not authenticated"
            );
        }

        var player =
            playerService.GetPlayer(
                packet!.PlayerId
            );


        return JsonSerializer.Serialize(
            new
            {
                Type = "PlayerStatusResponse",

                Player = new PlayerStatusDto
                {
                    Id = player.Id,

                    Wallet = player.Wallet,

                    Miners = player.Miners
                }
            },
            new JsonSerializerOptions
            {
                WriteIndented = true
            }
        );
    }
    
    private static string HandlePlayerSync(
        string json,
        PlayerSyncService syncService)
    {
        var packet =
            JsonSerializer.Deserialize<PlayerSyncRequest>(
                json
            );
        
        /*
        ServerLogger.Info(
            $"PlayerSync request: {packet.PlayerId}"
        );
        */
        
        /*
        ServerLogger.Info(
            $"Authenticated: {SessionManager.IsAuthenticated(packet.PlayerId)}"
        );
        */
        
        if(packet == null)
        {
            return Error(
                "Invalid PlayerSync packet"
            );
        }
        
        if(!SessionManager.IsAuthenticated(
                packet!.PlayerId))
        {
            return Error(
                "Player is not authenticated"
            );
        }
        
        var player =
            syncService.GetSnapshot(
                packet.PlayerId
            );


        if(player == null)
        {
            return Error(
                "Player not loaded"
            );
        }

        return JsonSerializer.Serialize(
            new PlayerSyncResponse
            {
                Player = player
            },
            new JsonSerializerOptions
            {
                WriteIndented = true
            }
        );
    }
    
    private static async Task<string> HandleBuyMiner(
        string json,
        PlayerService playerService,
        MinerService minerService)
    {
        var packet =
            JsonSerializer.Deserialize<BuyMinerPacket>(
                json
            );


        if(packet == null)
        {
            return Error(
                "Invalid BuyMiner packet"
            );
        }


        var player =
            playerService.GetPlayer(
                packet.PlayerId
            );


        if(player == null)
        {
            return Error(
                "Player not loaded"
            );
        }


        bool success =
            await minerService.Purchase(
                player,
                packet.MinerName
            );


        return JsonSerializer.Serialize(
            new
            {
                Type = "BuyMinerResponse",

                Success = success,

                Player = player
            },
            new JsonSerializerOptions
            {
                WriteIndented = true
            }
        );
    }

    private static string HandlePing(string json)
    {
        var ping =
            JsonSerializer.Deserialize<PingPacket>(json);


        return JsonSerializer.Serialize(
            new
            {
                Type = "Pong",
                Message = "Server Online",
                Version = ServerConfig.Version
            });
    }


    private static string Error(string message)
    {
        return JsonSerializer.Serialize(
            new
            {
                Type = "Error",
                Message = message
            });
    }
}