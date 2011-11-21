class Postfoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  has_attached_file :photo, :styles => { :medium => "640x480>", :small => "168x121>", :verysmall => "50x50>" },
                    :url  => "/images/postphotos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/postphotos/:id/:style/:basename.:extension"

#  attr_accessible :user_id, :post_id, :comment
end
