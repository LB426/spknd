class Rassylka < ActionMailer::Base
  def sendemailall(user, msg)
    @msg_text = msg.message
    if Rails.env.production?
      @user = user
    else
      @user = User.find(1)
      puts "#{msg.numsentmsg}\tшлем письмо #{@user.email} а должно быть #{user.email}"
    end
    subject       "рассылка от spknd.ru"
    from          "социально-правовая компания НАШ ДОМ <nashdom@spknd.ru>"
    recipients    @user.email
    sent_on       Time.now
  end
end
