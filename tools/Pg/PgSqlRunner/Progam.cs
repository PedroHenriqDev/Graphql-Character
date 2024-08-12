using Npgsql;

namespace PgSqlRunner;

public class Progam
{
    public static async Task<int> Main(string[] args)
    {
        if (!ValidateArguments(args, out string connectionString, out string scriptFilePath))
        {
            Console.WriteLine(MessagesResource.UsageMessage);
            return 1;
        }

        if (!File.Exists(scriptFilePath))
        {
            string message = string.Format(MessagesResource.FileNotFoundMessage, scriptFilePath);
            Console.WriteLine(message);
            return 1;
        }

        string scriptContent = File.ReadAllText(scriptFilePath);

        var (isSuccess, resultMessage) = await ExecuteScriptAsync(connectionString, scriptContent);

        Console.WriteLine(resultMessage);
        return isSuccess ? 1 : 0;
    }

    private static bool ValidateArguments(string[] args, out string connectionString, out string scriptFilePath)
    {
        connectionString = args[0];
        scriptFilePath = args[1];

        if (args.Length != 2)
        {
            Console.WriteLine(MessagesResource.UsageMessage);
            return false;
        }

        return true;
    }

    private static async Task<(bool isSuccess, string resultMessage)> ExecuteScriptAsync(string connectionString, string script)
    {
        try
        {
            using (var connection = new NpgsqlConnection(connectionString))
            {
                await connection.OpenAsync();

                using (var command = new NpgsqlCommand(script, connection))
                {
                    int rowsAffected = await command.ExecuteNonQueryAsync();
                    var resultMessage = string.Format(MessagesResource.SuccessfullyMessage, rowsAffected);
                    return (true, resultMessage);
                }
            }
        }
        catch (Exception ex)
        {
            var resultMessage = string.Format(MessagesResource.ErrorMessage, ex.Message, 0);
            return (false, resultMessage);
        }
    }
}


