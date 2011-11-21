class Nedvj < ActiveRecord::Base
  has_many :nedvjsphotos, :dependent => :destroy
  cattr_reader :per_page
    @@per_page = 10
end
