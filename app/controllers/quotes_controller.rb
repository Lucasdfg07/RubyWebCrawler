require 'nokogiri'
require 'open-uri'
require 'pry'

class QuotesController < ApplicationController
  before_action :set_quote, only: [:show]

  def show
    @quotes = Quote.all

    # @quotes = V1::QuotesController.show_url

    respond_to do |format|
      format.json
    end
  end


  private

  def set_quote
    @quote_search = params[:id]
  end
end
