namespace Server.Packets;

public class PlayerSyncRequest
{
    public string Type { get; set; } = "PlayerSync";

    public string PlayerId { get; set; } = "";
}