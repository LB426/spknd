class AddColumnsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :price, :integer
    add_column :posts, :pricecomment, :string
    add_column :posts, :category, :string
  end

  def self.down
    remove_column :posts, :category
    remove_column :posts, :pricecomment
    remove_column :posts, :price
  end
end
