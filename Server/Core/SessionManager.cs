namespace Server.Core;

public static class SessionManager
{
    private static readonly HashSet<string> _authenticated =
        new();


    public static void Authenticate(
        string playerId)
    {
        _authenticated.Add(
            playerId
        );
    }


    public static bool IsAuthenticated(
        string playerId)
    {
        return _authenticated.Contains(
            playerId
        );
    }


    public static void Remove(
        string playerId)
    {
        _authenticated.Remove(
            playerId
        );
    }
}