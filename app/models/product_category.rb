class ProductCategory < ActiveRecord::Base
  has_many :product_sections, :dependent => :destroy
  has_many :product_sub_sections, :through => :product_sections
end
