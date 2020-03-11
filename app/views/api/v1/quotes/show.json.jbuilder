# Json response
@quotes = Quote.all
@quotes_finding =  []

@quotes.each do |quote|
  @count = 0
  quote.tags.each do |tag|
    if quote.tags[@count].eql?(@quote_search)
      @is_present = true
      @quotes_finding << quote
    end
    @count += 1
  end
end

json.array! @quotes_finding do |q|
    json.quote q.quote
    json.author q.author
    json.author_about q.author_about
    json.tags q.tags
end
