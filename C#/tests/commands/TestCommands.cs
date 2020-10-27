using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using DSharpPlus;
using DSharpPlus.CommandsNext;
using DSharpPlus.CommandsNext.Attributes;

namespace TestBot
{
    class TestBotCommands
    {
        [Command("test")]
        public async Task test(CommandContext ctx)
        {
            await ctx.RespondAsync("Works");
        }
    }
}
