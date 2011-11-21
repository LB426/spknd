class UsersController < ApplicationController
  
  def index
    if current_user && /manager/ =~ current_user.groups
        @users = User.all
    else
      flash[:notice] = "Авторизуйтесь пожалуйста!"
      redirect_to login_path
    end
    
    rescue => err
      flash[:notice] = "Авторизуйтесь пожалуйста!#{err}"
      redirect_to login_path
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new
    
    if @user.signup!(params)
        @user.deliver_activation_instructions!
        # flash[:notice] = "<h2>Ваш аккаунт был успешно создан.<br>Инструкция по активации учётной записи<br>выслана на e-mail указанный при регистрации!</h2>"
        # redirect_to login_url
        render 'after_activate'
    else
        render :action => :new
    end
    
  end
  
  def edit
    if current_user
      if /manager/ =~ current_user.groups && 'current' != params[:id]
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    else
      flash[:notice] = "Авторизуйтесь пожалуйста!"
      redirect_to login_path
    end
    
    rescue => err
      flash[:notice] = "Авторизуйтесь пожалуйста!#{err}"
      redirect_to login_path
  end
  
  def update
    if current_user
      if /manager/ =~ current_user.groups
        @user = User.find(params[:id])
      else
        @user = current_user
      end
      if @user.update_attributes(params[:user])
        flash[:notice] = "Параметры пользователя успешно обновлены!"
        redirect_to profile_path
      else
        render :action => 'edit'
      end
    else
      flash[:notice] = "Авторизуйтесь пожалуйста!#{err}"
      redirect_to login_path
    end
    
    rescue => err
      flash[:notice] = "Авторизуйтесь пожалуйста!"
      redirect_to login_path
  end
  
  def destroy
    if current_user
      if /manager/ =~ current_user.groups
        @user = User.find(params[:id])
        @user.destroy
      else
        @user = current_user
        @user.destroy
      end
      redirect_to profile_path
    else
      flash[:notice] = "Авторизуйтесь пожалуйста!#{err}"
      redirect_to login_path
    end
    
    rescue => err
      flash[:notice] = "Авторизуйтесь пожалуйста!"
      redirect_to login_path
  end
  
end
