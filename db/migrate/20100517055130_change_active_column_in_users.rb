class ChangeActiveColumnInUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :active, :integer, :null => false, :default => 0
  end

  def self.down
  end
end
