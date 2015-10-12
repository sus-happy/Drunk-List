class RemoveParamFromBeer < ActiveRecord::Migration
  def change
    remove_column :beers, :sweet, :integer
    remove_column :beers, :bitter, :integer
    remove_column :beers, :sour, :integer
    remove_column :beers, :smell, :integer
  end
end
