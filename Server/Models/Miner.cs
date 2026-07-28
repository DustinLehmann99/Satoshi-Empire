namespace Server.Models;

public class Miner
{
    public string Id { get; set; } = 
        Guid.NewGuid().ToString();


    public string Name { get; set; } =
        "Unknown Miner";


    public double Hashrate { get; set; }


    public double Efficiency { get; set; }


    public int Condition { get; set; }


    public decimal LastReward { get; set; }


    public bool Active { get; set; } = true;
}