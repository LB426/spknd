class UserMessage < ActiveRecord::Base
  validates_presence_of :message
  validates_presence_of :komu
end
