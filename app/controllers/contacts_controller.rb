class ContactsController < ApplicationController
  def index
  end

  def sendemail
    name = "#{params[:name]}"
    sender = "#{name} <#{params[:email]}>"
    phone = "#{params[:phone]}"
    msg = "Телефон #{phone}\n#{params[:text]}\n"
    if name != '' && sender != '' && phone != '' && msg != '' then
      ContactsMailer.deliver_sendmailfromcontactspage( msg, sender )
    end
    
    redirect_to "/contacts"
  end

end
