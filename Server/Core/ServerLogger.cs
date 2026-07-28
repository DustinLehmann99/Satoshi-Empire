namespace Server.Core;

public static class ServerLogger
{
    private static readonly object _lock = new();

    private static string DirectoryPath =
        Path.Combine(
            AppContext.BaseDirectory,
            "Logs"
        );


    private static string CurrentLog =>
        Path.Combine(
            DirectoryPath,
            "current.log"
        );


    public static void Initialize()
    {
        Directory.CreateDirectory(
            DirectoryPath
        );


        if(File.Exists(CurrentLog))
        {
            Archive();
        }


        Write(
            "SERVER",
            "Logger initialized."
        );
    }


    public static void Info(
        string message)
    {
        Write(
            "INFO",
            message
        );
    }


    public static void Warning(
        string message)
    {
        Write(
            "WARN",
            message
        );
    }


    public static void Error(
        string message)
    {
        Write(
            "ERROR",
            message
        );
    }


    private static void Write(
        string level,
        string message)
    {
        lock(_lock)
        {
            string line =
                $"[{DateTime.UtcNow:yyyy-MM-dd HH:mm:ss}] [{level}] {message}";


            Console.WriteLine(
                line
            );


            File.AppendAllText(
                CurrentLog,
                line +
                Environment.NewLine
            );
        }
    }


    public static void Archive()
    {
        string archive =
            Path.Combine(
                DirectoryPath,
                $"{DateTime.UtcNow:yyyy-MM-dd_HH-mm-ss}.log"
            );


        File.Move(
            CurrentLog,
            archive
        );
    }
}