module Api::V1

  class QuotesController < ApplicationController
    before_action :set_quote, only: [:show]
    
    def show
      respond_to do |format|
        format.json
      end
    end

    private

    def set_quote
      @quote_search = params[:id]
    end
  end
end
