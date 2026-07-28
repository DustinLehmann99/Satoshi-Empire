namespace Server.Models;

public class Wallet
{
    public decimal Satoshi { get; set; }

    public decimal Bitcoin =>
        Satoshi / 100_000_000m;
}