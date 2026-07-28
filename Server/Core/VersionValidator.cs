namespace Server.Core;

public static class VersionValidator
{
    public static bool Valid(
        string version)
    {
        return version ==
               ServerConfig.Version;
    }
}