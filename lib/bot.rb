require 'telegram_bot'

token = 'Paste the token you got from the BotFather here'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    reply.text = case command
                 when /start/i
                   " Hello,#{message.from.first_name} #{message.from.last_name}.\nThis is a Covid 19 healthcare Bot.\n Don't forget to get vacinated"
                 when /morning/i
                   " Good Morning! #{message.from.first_name} #{message.from.last_name} .\n Hope you slept well?\n Before leaving the house check you Nose mask and sanitizer. \n Don't forget to keep Social distance. Have a Pleasant day."
                 when /afternoon/i
                   " Good Afternoon! Wear your mask.\n Keep social distance and sanitize your hand."
                 when /evening/i
                   " Good Evening! Wash your hands thoroughly before entering the house.\n Have a  restfull evening."
                 when /splash/i
                   ' hey! Wear your mask and sanitize your hand!.'
                 when /Symptoms/i
                   " Fever Chills New or worsening cough\n Fatigue and myalgia\n Headache\n Gastrointestinal symptoms (nausea, vomiting, diarrhea)..\nif you have this sysmptoms please visit your doctor."
                 when /precautions/i
                   " Wear a mask. \n Clean your hands \n Keep a safe distance.."
                 when /commands/i
                   " /start \n /morning \n /afternoon \n /evening \n /splash \n /Symptoms \n /precautions"
                 else
                   "I have no idea what #{command.inspect} means."
                 end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
