# подключение библиотеки  pyTelegramBotApi

import telebot
import os

bot = telebot.TeleBot('7352205784:AAGSj95ppq_ngIzF_NJjaMTUr94t5OTLBM4')

full_path = os.path.realpath(__file__)
full_path = os.path.dirname(full_path)
print(full_path)

@bot.message_handler(content_types=['text', 'photo', 'voice', 'video', 'video_note'])
def start(message):
    if message.text == "/start":
        bot.send_message(message.from_user.id, 'Привет, пингуюсь стабильно')

        fold_nick = full_path + "/users/" + str(message.from_user.id) + "/"
        
        if os.path.exists(fold_nick + "info.txt"):
            print('Пользователь уже зарегистрирован')
            with open(fold_nick + "info.txt", encoding="utf8") as f:
                user_NIK = f.readline()
                bot.send_message(message.from_user.id, "Добро пожаловать: " + user_NIK)
        else:
            bot.send_message(message.from_user.id, "Для регистрации придумайте ник!")
            bot.register_next_step_handler(message, regis)

def regis(message):
    fold_nick = full_path + "/users/" + str(message.from_user.id) + "/"
    print('Регистрация запущена')
    fold_user = full_path + "/users/" + str(message.from_user.id)
    
    if not os.path.exists(fold_user):
        os.makedirs(fold_user)
    
    if message.text and len(message.text) >= 3:
        user_nick = message.text
        print("Введен ник: " + user_nick)
         
        with open(fold_nick + "info.txt", "w", encoding="utf8") as document:
            document.write(user_nick)
        bot.send_message(message.from_user.id, "Регистрация успешно завершена")
        bot.send_message(message.from_user.id, "Добро пожаловать: " + user_nick)
    else:
        bot.send_message(message.from_user.id, "Ошибка, ник неправильный")
        bot.send_message(message.from_user.id, "Ник должен содержать не менее 3-х символов")
        bot.register_next_step_handler(message, regis)

bot.infinity_polling(timeout=100, long_polling_timeout=50)
