class ProductSection < ActiveRecord::Base
  belongs_to :product_category
  has_many :product_sub_sections, :dependent => :destroy
end
