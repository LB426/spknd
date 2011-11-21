class CreatePostfotos < ActiveRecord::Migration
  def self.up
    create_table :postfotos do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :comment
      t.timestamps
    end
  end
  
  def self.down
    drop_table :postfotos
  end
end
