class ContactsMailer < ActionMailer::Base
  
  def sendmailfromprofilepage( msg, sender )
    subject       "письмо из контактов сайта spknd.ru"
    from          "#{sender}"
    recipients    "nashdom@spknd.ru"
    sent_on       Time.now    
    body          "#{msg}"
  end

  def activation_instructions(user)
    subject       "инструкция активации"
    from          "социально-правовая компания НАШ ДОМ <nashdom@spknd.ru>"
    recipients    user.email
    sent_on       Time.now
    body          :activate_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Активация завершена"
    from          "социально-правовая компания НАШ ДОМ <noreply@spknd.ru>"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

  def password_reset_instructions(user)
    subject       "Инструкция по сбросу пароля"
    from          "социально-правовая компания НАШ ДОМ <noreply@spknd.ru>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

end
