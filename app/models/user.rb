class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :post_comments, :dependent => :destroy
  has_many :postfotos, :through => :posts
  
  acts_as_authentic do |c|
      c.logged_in_timeout = 60.minutes # default is 10.minutes
      c.validates_length_of_password_field_options = { :on => :update, :minimum => 6, :if => :has_no_credentials?}
      c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 6, :if => :has_no_credentials?}
  end
  
  has_attached_file :avatar, :styles => { :small => "120x120>", :verysmall => "48x48>" },
                    :url  => "/images/avatars/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/avatars/:id/:style/:basename.:extension"
  
  def has_no_credentials?
      if self.crypted_password.blank? then
      else
        return true
      end
  end
  
  def signup!(params)
      self.username = params[:user][:username]
      self.email = params[:user][:email]
      save_without_session_maintenance
  end
  
  def activate!(params)
      self.active = true
      self.password = params[:user][:password]
      self.password_confirmation = params[:user][:password_confirmation]
      save
  end
  
  def deliver_activation_instructions!
      reset_perishable_token!
      ContactsMailer.deliver_activation_instructions(self)
  end
  
  def deliver_activation_confirmation!
      reset_perishable_token!
      ContactsMailer.deliver_activation_confirmation(self)
  end
  
  def deliver_password_reset_instructions!
      reset_perishable_token!
      ContactsMailer.deliver_password_reset_instructions(self)
  end
  
end
