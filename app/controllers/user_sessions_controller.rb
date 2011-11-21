class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session], params[:user_session][:remember_me])
    if @user_session.save
      #flash[:notice] = "Successfully created user session."
      redirect_to profile_path
    else
      render :action => 'new'
    end
  end
  
  def destroy
    current_user_session.destroy
    #flash[:notice] = "Successfully destroyed user session."
    redirect_to root_url
  end
end
