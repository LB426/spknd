class AddAttachmentsPhotoToPostfotos < ActiveRecord::Migration
  def self.up
    add_column :postfotos, :photo_file_name, :string
    add_column :postfotos, :photo_content_type, :string
    add_column :postfotos, :photo_file_size, :integer
    add_column :postfotos, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :postfotos, :photo_file_name
    remove_column :postfotos, :photo_content_type
    remove_column :postfotos, :photo_file_size
    remove_column :postfotos, :photo_updated_at
  end
end
