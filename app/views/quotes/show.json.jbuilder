# Json response
@count = 0
json.quotes @quotes do |quotes|
  if quotes.tags[@count].eql?(@quote_search)
    json.quote quotes.quote
  end
  @count += 1
end
