namespace Server.Packets;

public class PlayerSyncResponse
{
    public string Type { get; set; } = "PlayerSync";

    public object? Player { get; set; }
}