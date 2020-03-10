class Quote
  include Mongoid::Document
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :tags, type: Array

  # has_secure_token :auth_token

  def self.create_collection(all_quotes_array)
    all_quotes_array.each do |quote|
      Quote.create(quote)
    end
  end
end
