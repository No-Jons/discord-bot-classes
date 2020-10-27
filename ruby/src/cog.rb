require 'discordrb'

module Cogs
  class Cog
    @__cog_commands__ = {}
    @commands_loaded = false

    def initialize(name: "Cog")
      @name = name
    end

    def name
      @name
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
