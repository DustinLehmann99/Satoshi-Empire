namespace Server.Packets;

public class LoginPacket
{
    public string Type {get;set;} = "";

    public string PlayerId {get;set;} = "";

    public string Version {get;set;} = "";
}