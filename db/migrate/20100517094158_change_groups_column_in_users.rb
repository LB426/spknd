class ChangeGroupsColumnInUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :groups, :string, :null => false, :default => 'blogger'
  end

  def self.down
  end
end
