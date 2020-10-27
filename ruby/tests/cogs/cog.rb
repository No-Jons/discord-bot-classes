require 'discordrb'
require '../src/cog'

class TestCog < Cogs::Cog
  def initialize(bot: Discordrb::Commands::CommandBot)
    super(name: "TestCog")
    @bot = bot
  end

  def commands
    @bot.command :cogtest do |event|
      event.respond "works"
    end
    @bot.command :cogs do |event|
      output = ""
      @bot.cogs.each do |i|
        output += "`" + i::name + "`\n"
      end
      event.respond output
    end
  end
end

def setup(bot)
  bot.add_cog(TestCog.new bot: bot)
end
