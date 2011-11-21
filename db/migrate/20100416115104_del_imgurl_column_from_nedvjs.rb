class DelImgurlColumnFromNedvjs < ActiveRecord::Migration
  def self.up
    remove_column :nedvjs, :imgurl
  end

  def self.down
  end
end
