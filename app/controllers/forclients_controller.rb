class ForclientsController < ApplicationController
  def index
    #@nedvjs = Nedvj.all( :order => 'id desc' )
    page = params[:page] || 1
    @nedvjs = Nedvj.paginate :page => page, :order => 'updated_at DESC'
  end
  
  def show
    page = params[:page] || 1
    if params[:id] == "kvarts" then
      #@nedvjs = Nedvj.find_all_by_category("квартиры")
      @nedvjs = Nedvj.paginate_by_category 'квартиры', :page => page, :order => 'updated_at DESC'
    end
    if params[:id] == "domovlad" then
      #@nedvjs = Nedvj.find_all_by_category("домовладения")
      @nedvjs = Nedvj.paginate_by_category 'домовладения', :page => page, :order => 'updated_at DESC'
    end
    if params[:id] == "kommers" then
      #@nedvjs = Nedvj.find_all_by_category("коммерческая недвижимость")
      @nedvjs = Nedvj.paginate_by_category 'коммерческая недвижимость', :page => page, :order => 'updated_at DESC'
    end
    if params[:id] == "zemuch" then
      #@nedvjs = Nedvj.find_all_by_category("земельные участки")
      @nedvjs = Nedvj.paginate_by_category 'земельные участки', :page => page, :order => 'updated_at DESC'
    end
    if params[:id] == "arenda" then
      #@nedvjs = Nedvj.find_all_by_category("аредна жилья")
      @nedvjs = Nedvj.paginate_by_category 'аренда жилья', :page => page, :order => 'updated_at DESC'
    end
  end

end
