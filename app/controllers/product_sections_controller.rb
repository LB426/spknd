class ProductSectionsController < ApplicationController
  before_filter :require_user_admin
  
  # GET /product_sections
  # GET /product_sections.xml
  def index
    @product_sections = ProductSection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_sections }
    end
  end

  # GET /product_sections/1
  # GET /product_sections/1.xml
  def show
    @product_section = ProductSection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_section }
    end
  end

  # GET /product_sections/new
  # GET /product_sections/new.xml
  def new
    @product_categories = ProductCategory.all :order => 'id ASC' 
    @product_section = ProductSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_section }
    end
  end

  # GET /product_sections/1/edit
  def edit
    @product_section = ProductSection.find(params[:id])
  end

  # POST /product_sections
  # POST /product_sections.xml
  def create
    product_category = ProductCategory.find(params[:product_section][:product_category_id])
    @product_section = product_category.product_sections.create(params[:product_section])
    
    #@product_section = ProductSection.new(params[:product_section])

    respond_to do |format|
      if @product_section.save
        format.html { redirect_to(@product_section, :notice => 'ProductSection was successfully created.') }
        format.xml  { render :xml => @product_section, :status => :created, :location => @product_section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_sections/1
  # PUT /product_sections/1.xml
  def update
    @product_section = ProductSection.find(params[:id])

    respond_to do |format|
      if @product_section.update_attributes(params[:product_section])
        format.html { redirect_to(@product_section, :notice => 'ProductSection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sections/1
  # DELETE /product_sections/1.xml
  def destroy
    @product_section = ProductSection.find(params[:id])
    @product_section.destroy

    respond_to do |format|
      format.html { redirect_to(product_sections_url) }
      format.xml  { head :ok }
    end
  end
end
