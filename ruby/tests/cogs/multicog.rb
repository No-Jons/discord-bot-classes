require 'discordrb'

class MultiCog
  def initialize(bot: Discordrb::Commands::CommandBot)
    @bot = bot
  end

  def commands
    @bot.command :multicog do |event|
      event.respond "works"
    end
  end
end

def setup(bot)
  bot.add_cog(MultiCog.new bot: bot)
end
