json.extract! @beer, :id, :name, :country, :sweet, :bitter, :sour, :smell, :alcohol, :memo, :created_at, :updated_at
json.count @beer.counters.count
if @beer.image
    json.image "/beers/"+@beer.id.to_s+"/image"
else
    json.image ""
end