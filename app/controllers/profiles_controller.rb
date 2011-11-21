class ProfilesController < ApplicationController
  before_filter :require_user
  
  def help

  end
  
  def showposts
    @posts = current_user.posts.find(:all)
    if @posts.size == 0 then
       redirect_to profile_path
    end
  end
  
  def showcomments
    @comments = current_user.post_comments.find(:all)
    if @comments.size == 0 then
       redirect_to profile_path
    end
  end
  
  def statistics
    @postcount = current_user.posts.count
    @commentcount = PostComment.count_by_sql "SELECT COUNT(*) FROM post_comments WHERE user_id = #{current_user.id}"
    if /manager/ =~ current_user.groups
      @users_count = User.count_by_sql "SELECT COUNT(*) FROM users"
      @users_count_activate = User.count_by_sql "SELECT COUNT(*) FROM users WHERE active = 1"
      @users_count_non_activate = User.count_by_sql "SELECT COUNT(*) FROM users WHERE active = 0"
    end
  end
  
  def sendemail
    sender = "#{current_user.username} <#{current_user.email}>"
    msg = "#{params[:text]}\n"
    if msg != '' then
      ContactsMailer.deliver_sendmailfromprofilepage( msg, sender )
    end
    
    redirect_to profile_path
  end
  
  def blank
  end
  
  def rassylka_new
  end
  
  def rassylka_create
    usrmsg = UserMessage.new
    usrmsg.message = params[:message]
    usrmsg.komu = params[:komu]
    if usrmsg.save
      flash[:notice] = "Рассылка запущена"
      redirect_to profile_path
    else
      flash[:notice] = "Ошибка в параметрах"
      redirect_to new_rassylka_path
    end
  end
  
end
