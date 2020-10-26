require 'discordrb'
require '../../src/cog'

class Cog < Cog::Cog
  def initialize(bot)
    super(bot)
  end

  def commands
    @bot.command :cogtest do |event|
      event.respond "works"
    end
    @_commands_loaded = true
  end
end

def setup(bot)
  bot.add_cog(Cog.new bot: bot)
end
