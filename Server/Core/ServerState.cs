namespace Server.Core;

public static class ServerState
{
    public static DateTime StartedAt { get; } =
        DateTime.UtcNow;
    
    private static readonly HashSet<string> ValidClients =
        new();

    public static int ConnectedPlayers { get; set; }
}