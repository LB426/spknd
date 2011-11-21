class DelCategoryColumnFromPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :category
  end

  def self.down
    add_column :posts, :category, :string
  end
end
