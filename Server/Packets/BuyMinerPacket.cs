namespace Server.Packets;

public class BuyMinerPacket
{
    public string Type { get; set; } = "BuyMiner";

    public string PlayerId { get; set; } = "";

    public string MinerName { get; set; } = "";
}