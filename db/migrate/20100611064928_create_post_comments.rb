class CreatePostComments < ActiveRecord::Migration
  def self.up
    create_table :post_comments do |t|
      t.string :name
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :post_comments
  end
end
