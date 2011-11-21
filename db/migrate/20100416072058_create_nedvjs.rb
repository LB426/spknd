class CreateNedvjs < ActiveRecord::Migration
  def self.up
    create_table :nedvjs do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :imgurl
      t.timestamps
    end
  end
  
  def self.down
    drop_table :nedvjs
  end
end
