require 'nokogiri'
require 'open-uri'
require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Quote.destroy_all

def create_quotes
  url = "http://quotes.toscrape.com/"

  html = open(url)

  doc = Nokogiri::HTML(html)

  quotes_tag = doc.css('.quote')

  all_quotes_array = []
  tags_array = []
  quotes_tag.each do |quote|
    title = quote.css('span').children[0].text
    author = quote.css('.author').text
    author_about = quote.css('span').children.css('a')[0].attribute('href').value

    count_tag = 0
    quote.css('.tags').children.children.each do |tag|
      tags_array << tag.text
      count_tag += 1
    end

    quotes = {
      quote: title,
      author: author,
      author_about: author_about,
      tags: tags_array
    }

    all_quotes_array << quotes
    tags_array = []
  end

  Quote.create_collection(all_quotes_array)
end

create_quotes
