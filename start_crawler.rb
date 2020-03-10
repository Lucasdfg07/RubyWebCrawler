require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  def get_quotes
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

      quote.css('.tags').css('a').children.map do |tag|
        tags_array << tag.text
      end

      quotes = {
        quote: title,
        author: author,
        author_about: author_about,
        tags: tags_array
      }

      all_quotes_array << quotes
    end
  end

end

scrape = Scraper.new
scrape.get_quotes
