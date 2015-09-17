json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :price, :sweet, :bitter, :sour, :smell, :alcohol, :memo
  json.url beer_url(beer, format: :json)
end
