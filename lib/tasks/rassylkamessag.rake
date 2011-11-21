require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :mailer do
  desc "Разослать всем зарегистрированным"
  task :all do |t, args|
    msgs = UserMessage.find_by_sql("SELECT * FROM user_messages WHERE result='запущено' ORDER BY id ASC LIMIT 1;")
    msgs.each do |msg|
      msg.result = 'начата'
      msg.save
      case msg.komu
      when /всем зарегистрированным/
        users = User.find_by_sql("SELECT * FROM users WHERE active=1 AND groups='blogger' AND email<>'anonymous@domain.tld';")
        users.each do |user|
          Rassylka.deliver_sendemailall(user, msg)
          msg.numsentmsg += 1
          msg.save
        end
        msg.result = 'закончена'
        msg.save
      when /всем кто оставил сообщение в разделе о недвижимости/
        puts "#{msg.komu} сообщение: #{msg.message}"
      else
        
      end
    end 
  end
end