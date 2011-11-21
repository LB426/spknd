class AddPricenoteColumnToNedvjs < ActiveRecord::Migration
  def self.up
    add_column :nedvjs, :pricenote, :string
  end

  def self.down
    remove_column :nedvjs, :pricenote
  end
end
