class ProductSubSectionsController < ApplicationController
  # GET /product_sub_sections
  # GET /product_sub_sections.xml
  def index
    @product_sub_sections = ProductSubSection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_sub_sections }
    end
  end

  # GET /product_sub_sections/1
  # GET /product_sub_sections/1.xml
  def show
    @product_sub_section = ProductSubSection.find(params[:id])
    
    @category = ProductCategory.find(@product_sub_section.product_category_id).category
    @section = ProductSection.find(@product_sub_section.product_section_id).section

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_sub_section }
    end
  end

  # GET /product_sub_sections/new
  # GET /product_sub_sections/new.xml
  def new
    @product_categories = ProductCategory.all :order => 'id ASC'
    @product_sections = ProductSection.all :order => 'id ASC'
    @product_sub_section = ProductSubSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_sub_section }
    end
  end

  # GET /product_sub_sections/1/edit
  def edit
    @product_sub_section = ProductSubSection.find(params[:id])
    
    @product_categories = ProductCategory.all :order => 'id ASC'
    @product_sections = ProductSection.all :order => 'id ASC'
    @product_category = ProductCategory.find(@product_sub_section.product_category_id)
    @product_section = ProductSection.find(@product_sub_section.product_section_id)
    
  end

  # POST /product_sub_sections
  # POST /product_sub_sections.xml
  def create
    product_category = ProductCategory.find(params[:product_sub_section][:product_category_id])
    product_section = product_category.product_sections.find(params[:product_sub_section][:product_section_id])
    @product_sub_section = product_section.product_sub_sections.create(params[:product_sub_section])
    
    # @product_sub_section = ProductSubSection.new(params[:product_sub_section])

    respond_to do |format|
      if @product_sub_section.save
        format.html { redirect_to(@product_sub_section, :notice => 'ProductSubSection was successfully created.') }
        format.xml  { render :xml => @product_sub_section, :status => :created, :location => @product_sub_section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_sub_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_sub_sections/1
  # PUT /product_sub_sections/1.xml
  def update
    @product_sub_section = ProductSubSection.find(params[:id])

    respond_to do |format|
      if @product_sub_section.update_attributes(params[:product_sub_section])
        format.html { redirect_to(@product_sub_section, :notice => 'ProductSubSection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_sub_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sub_sections/1
  # DELETE /product_sub_sections/1.xml
  def destroy
    @product_sub_section = ProductSubSection.find(params[:id])
    @product_sub_section.destroy

    respond_to do |format|
      format.html { redirect_to(product_sub_sections_url) }
      format.xml  { head :ok }
    end
  end
end
