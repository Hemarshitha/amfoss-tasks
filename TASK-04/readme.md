from telegram import Update
from telegram.ext import Updater, CommandHandler, CallbackContext


BOT_TOKEN = 'your_bot_token_here'

def start(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Welcome to PagePal! I can help you find books. Use /help to see available commands.')

def help_command(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Here are the available commands:\n/start - Welcome message\n/help - List of commands\n/book - Find books by genre\n/preview - Get preview link of a book\n/list - Manage your reading list\n/reading_list - View or edit your reading list')

def main() -> None:
    updater = Updater(BOT_TOKEN)
    dispatcher = updater.dispatcher

   
    dispatcher.add_handler(CommandHandler("start", start))
    dispatcher.add_handler(CommandHandler("help", help_command))


    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()








AIzaSyBQAIn4EPuGxcqXHOxFEYmPGaHiU-KLPQY



7261212025:AAGcpo9lAxPafmgqOFyPNyVv9PTAPOjC1uA
