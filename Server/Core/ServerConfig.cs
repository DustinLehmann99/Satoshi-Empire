namespace Server.Core;

public static class ServerConfig
{
    public const string Version = "0.1.9.2";
    public const string Host = "localhost";
    public const int Port = 8080;

    public static string Address => $"http://{Host}:{Port}/";
}