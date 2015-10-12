class RemovePriceFromBeer < ActiveRecord::Migration
  def change
    remove_column :beers, :price, :integer
  end
end
