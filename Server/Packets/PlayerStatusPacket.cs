namespace Server.Packets;

public class PlayerStatusPacket : Packet
{
    public PlayerStatusPacket()
    {
        Type = "PlayerStatus";
    }

    public string PlayerId { get; set; }
        = string.Empty;
}