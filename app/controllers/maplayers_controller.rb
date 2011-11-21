class MaplayersController < ApplicationController
  
  def index
    @post = Post.find(params[:id])
    @pic = @post.postfotos.all(:order => 'id asc')[0]
  end
  
  def setcoordinate
    if current_user
      @post = Post.find(params[:id])
      @post.lat = params[:latitude]
      @post.lng = params[:longitude]

      response.headers['Content-type'] = "text/plain; charset=utf-8"
      if @post.save
        render :text => "true", :layout => false
      else
        render :text => "false", :layout => false
      end
    else
      logger.debug "registrate"
      redirect_to 
    end

    rescue => err
      flash[:notice] = "Авторизуйтесь пожалуйста!#{err}"
      redirect_to login_path
  end
  
end
