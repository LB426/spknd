class DelPhotosColumnsFromNedvjs < ActiveRecord::Migration
  def self.up
    remove_column :nedvjs, :photo_file_name
    remove_column :nedvjs, :photo_content_type
    remove_column :nedvjs, :photo_file_size
    remove_column :nedvjs, :photo_updated_at
  end

  def self.down
  end
end
