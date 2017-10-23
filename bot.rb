require 'rubygems'
require 'telegram/bot'

token = ''

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|

    case message.text

    when '/byebye'
      bot.api.send_message(chat_id: message.chat.id, text: "tial #{message.from.first_name}!")
    
    when '/start'
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Fã Clube Oficial', url: 'https://t.me/RoboTaylor'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Documentação Ruby', url: 'https://www.ruby-lang.org/pt/documentation/')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: "Oi #{message.from.first_name}!\nsou o primeiro bot da equipe cybion feito em ruby😎", reply_markup: markup)
    
    when '/id'
      bot.api.send_message(chat_id: message.chat.id, text: "🔰 Suas Informações 🔰\n\nNome: #{message.from.first_name}\nUsername: #{message.from.username}\nId: #{message.from.id}\nchat: #{message.chat.type}")
      
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: "Oie! precisa de ajuda né?\n\n/start - inicia o bot.\n/id - suas informações.\n/help - esta mensagem.\n/byebye - o bot dá adeus rsrsr.")


    end
  end
end