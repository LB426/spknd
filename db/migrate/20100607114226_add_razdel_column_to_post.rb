class AddRazdelColumnToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :razdel, :integer
  end

  def self.down
    remove_column :posts, :razdel
  end
end
