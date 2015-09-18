class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :beer_id

      t.timestamps null: false
    end
  end
end
