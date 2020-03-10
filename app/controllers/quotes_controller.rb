require 'nokogiri'
require 'open-uri'
require 'pry'

class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all

    # render json: @quotes
    render json: get_url
  end

  def get_url
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
    return all_quotes_array
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = params[:id]
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.fetch(:quote, {})
    end
end
