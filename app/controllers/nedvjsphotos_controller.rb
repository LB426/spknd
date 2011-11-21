class NedvjsphotosController < ApplicationController
  before_filter :require_user
  
  def index
    @nedvjsphotos = Nedvjsphoto.all
  end
  
  def show
    @nedvjsphoto = Nedvjsphoto.find(params[:id])
    @nedvj = Nedvj.find(@nedvjsphoto.nedvj_id)
  end
  
  def new
    @nedvj = Nedvj.find(params[:nedvj_id])
    @nedvjsphoto = Nedvjsphoto.new
  end
  
  def create
    p = params[:nedvjsphoto]
    nedvj = Nedvj.find(p[:nedvj_id])
    @nedvjsphoto = Nedvjsphoto.new(params[:nedvjsphoto])
    if @nedvjsphoto.save
      flash[:notice] = "Successfully created nedvjsphoto."
      redirect_to nedvj
    else
      render :action => 'new'
    end
  end
  
  def edit
    @nedvjsphoto = Nedvjsphoto.find(params[:id])
    @nedvj = Nedvj.find(@nedvjsphoto.nedvj_id )
  end
  
  def update
    @nedvjsphoto = Nedvjsphoto.find(params[:id])
    if @nedvjsphoto.update_attributes(params[:nedvjsphoto])
      flash[:notice] = "Successfully updated nedvjsphoto."
      redirect_to @nedvjsphoto
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @nedvjsphoto = Nedvjsphoto.find(params[:id])
    nedvj = Nedvj.first(:conditions => "id = #{@nedvjsphoto.nedvj_id}" )
    @nedvjsphoto.destroy
    flash[:notice] = "Successfully destroyed nedvjsphoto."
    redirect_to nedvj_path(nedvj)
  end
end
