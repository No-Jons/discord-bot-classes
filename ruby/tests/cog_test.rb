require 'discordrb'
require '../src/base_bot_class'
require '../src/utils/auth'

class Bot < BaseBot::BaseBotClass
  def initialize(token, prefix)
    super(token, prefix)
    @cog_dir = '../tests/cogs/'
  end

  def add_commands
    self.command :test do |event|
      event.respond("works")
    end
  end

  def before
    %w(cog multicog).each do |i|
      self.load_cog("#{@cog_dir}#{i}")
    end
  end
end

Bot.new(Auth::DISCORD_TOKEN, "r!").run_bot
