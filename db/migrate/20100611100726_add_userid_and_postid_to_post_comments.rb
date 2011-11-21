class AddUseridAndPostidToPostComments < ActiveRecord::Migration
  def self.up
    add_column :post_comments, :user_id, :integer
    add_column :post_comments, :post_id, :integer
  end

  def self.down
    remove_column :post_comments, :post_id
    remove_column :post_comments, :user_id
  end
end
