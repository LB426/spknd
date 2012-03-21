class AddMoreOptionsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :options, :text
  end

  def self.down
    remove_column :posts, :options
  end
end
