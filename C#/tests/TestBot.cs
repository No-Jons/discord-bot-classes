using System;
using System.Threading.Tasks;
using DSharpPlus;
using DSharpPlus.CommandsNext;
using DSharpPlus.CommandsNext.Attributes;
using TestBot;


namespace NoJonsBot
{
    class Bot : BaseBot
    {
        public BaseBot bot;
        public Bot(DiscordConfiguration configuration, string prefix) : base(configuration, prefix)
        {
            bot = new BaseBot(configuration, prefix);
            commands.RegisterCommands<BaseBotCommands>();
            commands.RegisterCommands<TestBotCommands>();
            Run();
        }

        static void Main(string[] args)
        {
            new Bot(
            new DiscordConfiguration
            {
                Token = Auth.Token,
                TokenType = TokenType.Bot,
                AutoReconnect = true,
                UseInternalLogHandler = false,
                LogLevel = LogLevel.Debug
            }, "c!");
        }
        class BaseBotCommands
        {
            [Command("close")]
            public async Task close(CommandContext ctx)
            {
                if (ctx.User.Id == 448250281097035777)
                {
                    await ctx.RespondAsync("Closing Bot...");
                    await ctx.Client.DisconnectAsync();
                    ctx.Client.Dispose();
                }
            }
        }
    }
}
