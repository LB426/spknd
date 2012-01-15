class CreateProductSections < ActiveRecord::Migration
  def self.up
    create_table :product_sections do |t|
      t.string :section
      t.integer :product_category_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :product_sections
  end
end
