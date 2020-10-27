require 'discordrb'
require '../src/utils/auth'

module BaseBot
  class BaseBotClass < Discordrb::Commands::CommandBot
    def initialize(token, prefix)
      super token: token, prefix: prefix
      @cogs = []
    end

    def cogs
      @cogs
    end

    def add_commands
      nil
    end

    def run_bot
      self.before
      self.add_commands
      begin
        self.run
      ensure
        self.after
      end
    end

    def before
      nil
    end

    def after
      nil
    end

    def load_cog(fp)
      begin
        require fp
        setup(self)
      rescue LoadError, NoMethodError => error
        self.log_exception(error)
      end
    end

    def add_cog(cog)
      begin
        cog.commands
        @cogs.append(cog)
      rescue NoMethodError => error
        self.log_exception(error)
      end
    end
  end
end

# BaseBot::BaseBotClass.new(token = Auth::DISCORD_TOKEN, prefix = "r!").run_bot
