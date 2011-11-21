class AddFioToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fio, :string
  end

  def self.down
    remove_column :users, :fio
  end
end
