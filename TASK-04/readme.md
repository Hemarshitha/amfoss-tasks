import os
import csv
import requests
from telegram import InlineKeyboardButton, InlineKeyboardMarkup, Update
from telegram.ext import (Updater, CommandHandler, MessageHandler, Filters, CallbackQueryHandler)
from docx import Document

# Load Google Books API key and Bot Token from environment variables
API_KEY = "YOUR_GOOGLE_API_KEY"  # Replace with your Google Books API Key
BOT_TOKEN = "YOUR_TELEGRAM_BOT_TOKEN"  # Replace with your Telegram Bot Token

# Global reading list
reading_list = []

# Start command
def start(update: Update, context):
    update.message.reply_text("Welcome to PagePal! I'm here to help you find great books.")

# Book search by genre
def fetch_books_by_genre(genre):
    url = f'https://www.googleapis.com/books/v1/volumes?q=subject:{genre}&key={API_KEY}'
    response = requests.get(url)
    books = response.json().get('items', [])
    return [
        {
            "Title": book['volumeInfo'].get('title'),
            "Author": ', '.join(book['volumeInfo'].get('authors', [])),
            "Description": book['volumeInfo'].get('description', 'No description'),
            "Published Year": book['volumeInfo'].get('publishedDate', 'Unknown'),
            "Language": book['volumeInfo'].get('language', 'Unknown'),
            "Preview Link": book['volumeInfo'].get('previewLink', 'N/A')
        }
        for book in books
    ]

# /book command
def book(update: Update, context):
    update.message.reply_text("Please type the genre of the book you want.")
    context.user_data['action'] = 'book'

# Respond to genre input
def respond_to_genre(update: Update, context):
    if context.user_data.get('action') == 'book':
        genre = update.message.text
        books = fetch_books_by_genre(genre)
        file_name = f'{genre}_books.csv'
        with open(file_name, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=books[0].keys())
            writer.writeheader()
            writer.writerows(books)
        context.bot.send_document(chat_id=update.message.chat_id, document=open(file_name, 'rb'))
        context.user_data['action'] = None

# Preview command
def preview(update: Update, context):
    update.message.reply_text("Please type the name of the book for preview.")
    context.user_data['action'] = 'preview'

def respond_to_preview(update: Update, context):
    if context.user_data.get('action') == 'preview':
        book_name = update.message.text
        url = f'https://www.googleapis.com/books/v1/volumes?q={book_name}&key={API_KEY}'
        response = requests.get(url)
        books = response.json().get('items', [])
        if books:
            preview_link = books[0]['volumeInfo'].get('previewLink', 'No preview available')
            update.message.reply_text(f'Preview: {preview_link}')
        else:
            update.message.reply_text('No books found!')
        context.user_data['action'] = None

# Reading list commands
def reading_list_command(update: Update, context):
    keyboard = [
        [InlineKeyboardButton("Add a book", callback_data='add')],
        [InlineKeyboardButton("Delete a book", callback_data='delete')],
        [InlineKeyboardButton("View Reading List", callback_data='view')],
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    update.message.reply_text('Manage your reading list:', reply_markup=reply_markup)

def handle_button_click(update: Update, context):
    query = update.callback_query
    query.answer()
    if query.data == 'add':
        query.message.reply_text('Type the book name to add.')
        context.user_data['action'] = 'add_book'
    elif query.data == 'delete':
        query.message.reply_text('Type the book name to delete.')
        context.user_data['action'] = 'delete_book'
    elif query.data == 'view':
        context.bot.send_document(chat_id=update.message.chat_id, document=open('reading_list.docx', 'rb'))

# Help command
def help_command(update: Update, context):
    help_text = "/start - Welcome message\n/book - Search books by genre\n/preview - Preview a book\n/reading_list - Manage your reading list\n/help - List all commands"
    update.message.reply_text(help_text)

# Main function
def main():
    updater = Updater(BOT_TOKEN, use_context=True)
    dp = updater.dispatcher

    dp.add_handler(CommandHandler("start", start))
    dp.add_handler(CommandHandler("book", book))
    dp.add_handler(MessageHandler(Filters.text & ~Filters.command, respond_to_genre))
    dp.add_handler(CommandHandler("preview", preview))
    dp.add_handler(MessageHandler(Filters.text & ~Filters.command, respond_to_preview))
    dp.add_handler(CommandHandler("reading_list", reading_list_command))
    dp.add_handler(CallbackQueryHandler(handle_button_click))
    dp.add_handler(CommandHandler("help", help_command))

    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()









AIzaSyBQAIn4EPuGxcqXHOxFEYmPGaHiU-KLPQY



7261212025:AAGcpo9lAxPafmgqOFyPNyVv9PTAPOjC1uA
