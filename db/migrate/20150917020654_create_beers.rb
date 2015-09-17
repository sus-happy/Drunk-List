class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :price
      t.integer :sweet
      t.integer :bitter
      t.integer :sour
      t.integer :smell
      t.float :alcohol
      t.text :memo

      t.timestamps null: false
    end
  end
end
