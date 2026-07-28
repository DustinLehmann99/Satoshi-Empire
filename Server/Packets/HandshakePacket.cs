namespace Server.Packets;

public class HandshakePacket
{
    public string Type { get; set; } = "Handshake";

    public string Version { get; set; } = "";
}