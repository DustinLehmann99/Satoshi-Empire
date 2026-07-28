namespace Server.Models;

public class Player
{
    public string Id { get; set; } = string.Empty;

    public string Name { get; set; } = "Player";

    public DateTime Created { get; set; }

    public Wallet Wallet { get; set; } = new();

    public List<Miner> Miners { get; set; } = new();
}