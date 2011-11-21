class CreateNedvjsphotos < ActiveRecord::Migration
  def self.up
    create_table :nedvjsphotos do |t|
      t.integer :nedvj_id
      t.string :notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :nedvjsphotos
  end
end
