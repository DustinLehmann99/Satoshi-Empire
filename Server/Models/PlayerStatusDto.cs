namespace Server.Models;

public class PlayerStatusDto
{
    public string Id { get; set; }
        = string.Empty;


    public Wallet Wallet { get; set; }
        = new();


    public List<Miner> Miners { get; set; }
        = new();
}