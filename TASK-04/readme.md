import os
import csv
import requests
from telegram import InlineKeyboardButton, InlineKeyboardMarkup, Update
from telegram.ext import (Application, CommandHandler, MessageHandler, filters, CallbackQueryHandler)
from docx import Document

API_KEY = "YOUR_GOOGLE_API_KEY"
BOT_TOKEN = "YOUR_TELEGRAM_BOT_TOKEN"

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
        with open(file_name, 'w', newline='')










AIzaSyBQAIn4EPuGxcqXHOxFEYmPGaHiU-KLPQY



7261212025:AAGcpo9lAxPafmgqOFyPNyVv9PTAPOjC1uA
