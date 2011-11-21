class NedvjsController < ApplicationController
  before_filter :require_user
  
  def index
    @nedvjs = Nedvj.all
  end
  
  def show
    @nedvj = Nedvj.find(params[:id])
    @nedvjsphotos = @nedvj.nedvjsphotos.all
  end
  
  def new
    @nedvj = Nedvj.new
  end
  
  def create
    @nedvj = Nedvj.new(params[:nedvj])
    if @nedvj.save
      flash[:notice] = "Successfully created nedvj."
      redirect_to @nedvj
    else
      render :action => 'new'
    end
  end
  
  def edit
    @nedvj = Nedvj.find(params[:id])
  end
  
  def update
    pn = params[:nedvjcategory]
    pr = params[:nedvj]
    pr["category"] = pn
    
    @nedvj = Nedvj.find(params[:id])
    #if @nedvj.update_attributes(params[:nedvj])
    if @nedvj.update_attributes(pr)
      flash[:notice] = "Successfully updated nedvj."
      redirect_to @nedvj
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @nedvj = Nedvj.find(params[:id])
    @nedvj.destroy
    flash[:notice] = "Successfully destroyed nedvj."
    redirect_to nedvjs_url
  end
  
  
  
end
