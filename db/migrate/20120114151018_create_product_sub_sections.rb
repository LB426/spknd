class CreateProductSubSections < ActiveRecord::Migration
  def self.up
    create_table :product_sub_sections do |t|
      t.string :subsection
      t.integer :product_category_id
      t.integer :product_section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_sub_sections
  end
end
