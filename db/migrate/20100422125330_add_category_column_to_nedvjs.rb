class AddCategoryColumnToNedvjs < ActiveRecord::Migration
  def self.up
    add_column :nedvjs, :category, :string
  end

  def self.down
    remove_column :nedvjs, :category
  end
end
