require 'discordrb'

module Cogs
  class Cog
    def initialize(name: "Cog")
      @name = name
    end

    def name
      @name
    end

  end
end
