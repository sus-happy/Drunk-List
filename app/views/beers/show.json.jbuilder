json.extract! @beer, :id, :name, :country, :price, :sweet, :bitter, :sour, :smell, :alcohol, :memo, :created_at, :updated_at
json.count @beer.counters.count