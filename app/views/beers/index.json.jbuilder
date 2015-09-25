json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :price, :alcohol, :country
  json.count beer.counters.count
  json.url beer_url(beer, format: :json)
end
