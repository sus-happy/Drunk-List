class AddColumnImageToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :image, :binary
  end
end
