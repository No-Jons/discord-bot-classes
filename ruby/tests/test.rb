require 'discordrb'
require 'wikipedia'

load 'src/utils/auth.rb'

bot = Discordrb::Commands::CommandBot.new token: Auth::DISCORD_TOKEN, prefix: 'r!'

bot.command :search do |event, *args|
  args = args.join(' ')
  page = Wikipedia.find args
  if page == nil
    event.respond "Nothing found..."
    break
  end
  event.respond page.fullurl
end

bot.command :find_img do |event, *args|
  args = args.join(' ')
  page = Wikipedia.find_image args
  if page == nil
    event.respond "Nothing found..."
    break
  end
  event.respond page.fullurl
end

bot.command :random do |event|
  page = Wikipedia.find_random options: 'page'
  event.respond page.fullurl
end

bot.command :eval do |event, *, code|
  break unless event.user.id == 448250281097035777

  p code
  code = code.gsub /```(rb)?/, ""
  p code

  begin
    output = eval code
  rescue => error
    event.respond "Error encountered :pensive::\n```#{error.message}```"
    break
  end
  event.respond "```rb\n#{output}\n```"
end

bot.run