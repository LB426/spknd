class CreateCatandrazds < ActiveRecord::Migration
  def self.up
    create_table :catandrazds do |t|
      t.string :category
      t.integer :cat_id
      t.string :razdel
      t.integer :razd_id

      t.timestamps
    end
  end

  def self.down
    drop_table :catandrazds
  end
end
