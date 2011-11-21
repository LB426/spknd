class PostfotosController < ApplicationController
  def index
    @postfotos = Postfoto.all
  end
  
  def show
    @postfoto = Postfoto.find(params[:id])
  end
  
  def new
    @postfoto = Postfoto.new
  end
  
  def create
    @postfoto = Postfoto.new(params[:postfoto])
    if @postfoto.save
      flash[:notice] = "Successfully created postfoto."
      redirect_to @postfoto
    else
      render :action => 'new'
    end
  end
  
  def edit
    @postfoto = Postfoto.find(params[:id])
  end
  
  def update
    @postfoto = Postfoto.find(params[:id])
    if @postfoto.update_attributes(params[:postfoto])
      flash[:notice] = "Successfully updated postfoto."
      #redirect_to edit_postfoto_path( @postfoto )
      redirect_to edit_post_path(@postfoto.post_id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @postfoto = Postfoto.find(params[:id])
    @postfoto.destroy
    flash[:notice] = "Successfully destroyed postfoto."
    redirect_to postfotos_url
  end
end
