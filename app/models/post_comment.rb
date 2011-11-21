class PostComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  #attr_accessible :name, :content
  
  validates_format_of :content, :with => /^[а-яА-Я . ' !?0-9]+$/i, :message => "в комментариях могут быть только русские буквы и никакиких ссылок!!!"
  
end
