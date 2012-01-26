class AddSubSectionIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :sub_section_id, :integer
  end

  def self.down
    remove_column :posts, :sub_section_id
  end
end
