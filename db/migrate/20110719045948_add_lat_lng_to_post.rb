class AddLatLngToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :lat, :string
    add_column :posts, :lng, :string
  end

  def self.down
    remove_column :posts, :lng
    remove_column :posts, :lat
  end
end
