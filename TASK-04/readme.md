from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Updater, CommandHandler, CallbackQueryHandler, MessageHandler, Filters, CallbackContext
import requests
import csv

# Set the bot token and Google Books API key
BOT_TOKEN = 'your_telegram_bot_token_here'
GOOGLE_BOOKS_API_KEY = 'your_google_books_api_key_here'

# Define the /start command
def start(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Welcome to PagePal! I can help you find books. Use /help to see available commands.')

# Define the /help command
def help_command(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Here are the available commands:\n/start - Welcome message\n/book - Find books by genre\n/preview - Get preview link of a book\n/list - Manage your reading list\n/reading_list - View or edit your reading list')

# Define the /book command
def book(update: Update, context: CallbackContext) -> None:
    update.message.reply_text('Please enter the genre of the book you are looking for.')

# Main function to start the bot
def main() -> None:
    updater = Updater(BOT_TOKEN)
    dispatcher = updater.dispatcher

    # Add command handlers
    dispatcher.add_handler(CommandHandler("start", start))
    dispatcher.add_handler(CommandHandler("help", help_command))
    dispatcher.add_handler(CommandHandler("book", book))

    # Start the bot
    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()







AIzaSyBQAIn4EPuGxcqXHOxFEYmPGaHiU-KLPQY



7261212025:AAGcpo9lAxPafmgqOFyPNyVv9PTAPOjC1uA
