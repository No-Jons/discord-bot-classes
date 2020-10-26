module Cog
  class Cog
    def initialize(bot)
      @bot = bot
      @__cog_commands__ = {}
      @_commands_loaded = false
    end

    def get_commands
      commands = []
      @__cog_commands__.each do |i|
        commands.append(i)
      end
      commands
    end

  end
end
