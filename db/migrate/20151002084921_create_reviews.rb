class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :beer_id
      t.integer :user_id
      t.integer :sweet
      t.integer :bitter
      t.integer :sour
      t.integer :smell
      t.text :comment

      t.timestamps null: false
    end
  end
end
