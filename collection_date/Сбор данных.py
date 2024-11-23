import requests
from bs4 import BeautifulSoup
import json

# Функция для сбора данных с одной страницы
def scrape_page(page_url):
    response = requests.get(page_url)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    quotes_data = []
    quotes = soup.find_all('div', class_='quote')
    
    for quote in quotes:
        text = quote.find('span', class_='text').get_text()
        author = quote.find('small', class_='author').get_text()
        tags = [tag.get_text() for tag in quote.find_all('a', class_='tag')]
        
        quotes_data.append({
            'text': text,
            'author': author,
            'tags': tags
        })
    
    return quotes_data

# Функция для сбора данных со всех страниц
def scrape_all_pages(base_url):
    all_quotes = []
    page = 1
    while True:
        page_url = f'{base_url}/page/{page}/'
        quotes_on_page = scrape_page(page_url)
        
        if not quotes_on_page:
            break
        
        all_quotes.extend(quotes_on_page)
        page += 1
    
    return all_quotes

# URL сайта
base_url = 'http://quotes.toscrape.com'

# Сбор всех цитат
quotes = scrape_all_pages(base_url)

# Сохранение данных в JSON файл
with open('quotes.json', 'w', encoding='utf-8') as f:
    json.dump(quotes, f, ensure_ascii=False, indent=4)