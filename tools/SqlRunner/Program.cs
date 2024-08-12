using Npgsql;

namespace SqlRunner;

public class Progam
{
    public static async Task Main(string[] args)
    {
        try
        {
            if (args.Length != 2)
            {
                Console.WriteLine(MessagesResource.UsageMessage);
                return;
            }

            string connectionString = args[0];
            string scriptFilePath = args[1];
            Console.WriteLine($"Connection String: {connectionString}");
            Console.WriteLine($"Script File Path: {scriptFilePath}");

            if (!File.Exists(scriptFilePath))
            {
                string message = string.Format(MessagesResource.FileNotFoundMessage, scriptFilePath);
                Console.WriteLine(message);
                return;
            }

            string scriptContent = File.ReadAllText(scriptFilePath);

            using (var connection = new NpgsqlConnection(connectionString))
            {
                await connection.OpenAsync();

                using (var command = new NpgsqlCommand(scriptContent, connection))
                {
                    int rowsAffected = await command.ExecuteNonQueryAsync();
                    Console.WriteLine($"Rows Affected: {rowsAffected}");
                }
            }

            Console.WriteLine("Script executed successfully");
        }
        catch(Exception ex) 
        {
            Console.WriteLine($"{MessagesResource.ErrorMessage}");
            Console.WriteLine($"{ex.Message} \n Stack Trace: {ex.StackTrace}");
        }
    }
}


