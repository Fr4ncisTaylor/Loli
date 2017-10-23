require 'rubygems'
require 'telegram/bot'

token = ''

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|

    case message.text
    when '/testan'
      bot.api.send_message(chat_id: message.chat.id, text: "oi #{message.from.first_name}!\n sou o primeiro bot da equipe a ser feito com ruby")
    when '/byebye'
      bot.api.send_message(chat_id: message.chat.id, text: "tial #{message.from.first_name}!")
    when '/photo'
      bot.api.send_photo(chat_id: message.chat.id, photo:'AgADAQADu6cxG55faEdeH5iWiaFFR0we9y8ABNf9hW1Gn5Sfv8AAAgI')
    when '/start'
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Fã Clube Oficial', url: 'https://t.me/RoboTaylor'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Documentação Ruby', url: 'https://www.ruby-lang.org/pt/documentation/')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: "Oi #{message.from.first_name}!\nsou o primeiro bot da equipe cybion feito em ruby.", reply_markup: markup)
    when '/stk'
      bot.api.send_sticker(chat_id: message.chat.id, sticker: "CAADBAADZAIAAnpiZAX1uOyhhzbAWgI")
    when '/id'
      bot.api.send_message(chat_id: message.chat.id, text: "🔰 Suas Informações 🔰\n\nNome: #{message.from.first_name}\nUsername: #{message.from.username}\nId: #{message.from.id}\nchat: #{message.chat.type}")
      
    when '/doc'
      bot.api.send_document(chat_id: message.chat.id, document: 'BQADAQADGgADnl9oR82naPTr8-BpAg')


    end
  end
end