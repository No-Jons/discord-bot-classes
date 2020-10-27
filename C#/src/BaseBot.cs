using System;
using System.Diagnostics;
using System.Threading.Tasks;
using DSharpPlus;
using DSharpPlus.EventArgs;
using DSharpPlus.CommandsNext;

class BaseBot
{
    public DiscordConfiguration config;
    public DiscordClient discord;
    public CommandsNextModule commands;

    public BaseBot(DiscordConfiguration configuration, string commandPrefix)
    {
        this.config = configuration;
        this.discord = new DiscordClient(config);
        this.commands = discord.UseCommandsNext(new CommandsNextConfiguration
        {
            StringPrefix = commandPrefix
        });
        this.discord.DebugLogger.LogMessageReceived += this.DefLog;
    }

    public void Run()
    {
        try
        {
            Before();
            MainAsync().ConfigureAwait(false).GetAwaiter().GetResult();
        }
        finally
        {
            After();
        }
    }

    public async Task MainAsync()
    {
        await this.discord.ConnectAsync();
        await Task.Delay(-1);
    }

    public async Task Close()
    {
        // before close
        this.Log("Received command to close bot...");
        await this.discord.DisconnectAsync();
        this.discord.Dispose();
        // after close
    }

    public void DefLog(object sender = null, DebugLogMessageEventArgs e = null)
        => Debug.WriteLine($"[{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}] {e.Level} {e.Message}");

    public void Log(string message)
        => Debug.WriteLine($"[{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}] {LogLevel.Info.ToString()} {message}");

    public void Before()
    {
        this.Log("Starting bot..."); // do stuff before bot runs
    }

    public void After()
    {
        this.Log("Bot connection closed"); // do stuff after bot runs, cleanup
    }
}
