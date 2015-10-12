class AddColumnThumbToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :thumb, :binary
  end
end
