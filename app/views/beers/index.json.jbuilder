json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :alcohol, :country
  json.count beer.counters.count
  json.url beer_url(beer, format: :json)
  if beer.thumb
    json.thumb "/beers/"+beer.id.to_s+"/thumb"
  else
    json.thumb ""
  end
end
