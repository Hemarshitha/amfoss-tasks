import asyncio
import os
import csv
import aiohttp
from telegram import InlineKeyboardButton, InlineKeyboardMarkup, Update
from telegram.ext import (Application, CommandHandler, MessageHandler, filters, CallbackQueryHandler, DictPersistence)
from docx import Document

# Load Google Books API key and Bot Token from environment variables
API_KEY = "YOUR_GOOGLE_API_KEY"
BOT_TOKEN = "YOUR_TELEGRAM_BOT_TOKEN"

# Global reading list
reading_list = []

# Start command
async def start(update: Update, context):
    await update.message.reply_text("Welcome to PagePal! I'm here to help you find great books.")

# Book search by genre
async def fetch_books_by_genre(genre):
    url = f'https://www.googleapis.com/books/v1/volumes?q=subject:{genre}&key={API_KEY}'
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            books_data = await response.json()
            books = books_data.get('items', [])
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
async def book(update: Update, context):
    await update.message.reply_text("Please type the genre of the book you want.")
    context.user_data['action'] = 'book'

# Respond to genre input
async def respond_to_genre(update: Update, context):
    if context.user_data.get('action') == 'book':
        genre = update.message.text
        books = await fetch_books_by_genre(genre)
        file_name = f'{genre}_books.csv'
        with open(file_name, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=books[0].keys())
            writer.writeheader()
            writer.writerows(books)
        await context.bot.send_document(chat_id=update.message.chat_id, document=open(file_name, 'rb'))
        context.user_data['action'] = None

# Preview command
async def preview(update: Update, context):
    await update.message.reply_text("Please type the name of the book for preview.")
    context.user_data['action'] = 'preview'

async def respond_to_preview(update: Update, context):
    if context.user_data.get('action') == 'preview':
        book_name = update.message.text
        url = f'https://www.googleapis.com/books/v1/volumes?q={book_name}&key={API_KEY}'
        async with aiohttp.ClientSession() as session:
            async with session.get(url) as response:
                books_data = await response.json()
                books = books_data.get('items', [])
                if books:
                    preview_link = books[0]['volumeInfo'].get('previewLink', 'No preview available')
                    await update.message.reply_text(f'Preview: {preview_link}')
                else:
                    await update.message.reply_text('No books found!')
        context.user_data['action'] = None

# Reading list commands
async def reading_list_command(update: Update, context):
    keyboard = [
        [InlineKeyboardButton("Add a book", callback_data='add')],
        [InlineKeyboardButton("Delete a book", callback_data='delete')],
        [InlineKeyboardButton("View Reading List", callback_data='view')],
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    await update.message.reply_text('Manage your reading list:', reply_markup=reply_markup)

async def handle_button_click(update: Update, context):
    query = update.callback_query
    await query.answer()
    if query.data == 'add':
        await query.message.reply_text('Type the book name to add.')
        context.user_data['action'] = 'add_book'
    elif query.data == 'delete':
        await query.message.reply_text('Type the book name to delete.')
        context.user_data['action'] = 'delete_book'
    elif query.data == 'view':
        await context.bot.send_document(chat_id=update.message.chat_id, document=open('reading_list.docx', 'rb'))

# Help command
async def help_command(update: Update, context):
    help_text = "/start - Welcome message\n/book - Search books by genre\n/preview - Preview a book\n/reading_list - Manage your reading list\n/help - List all commands"
    await update.message.reply_text(help_text)

# Main function
async def main():
    # Enable persistence to use context.user_data
    persistence = DictPersistence()

    # Initialize the application
    application = Application.builder().token(BOT_TOKEN).persistence(persistence).build()

    # Add handlers
    application.add_handler(CommandHandler("start", start))
    application.add_handler(CommandHandler("book", book))
    application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, respond_to_genre))
    application.add_handler(CommandHandler("preview", preview))
    application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, respond_to_preview))
    application.add_handler(CommandHandler("reading_list", reading_list_command))
    application.add_handler(CallbackQueryHandler(handle_button_click))
    application.add_handler(CommandHandler("help", help_command))

    # Run polling
    try:
        await application.initialize()  # Initialize the application
        await application.run_polling()
    finally:
        await application.shutdown()  # Ensure proper shutdown

if __name__ == '__main__':
    asyncio.run(main())













AIzaSyBQAIn4EPuGxcqXHOxFEYmPGaHiU-KLPQY



7261212025:AAGcpo9lAxPafmgqOFyPNyVv9PTAPOjC1uA
