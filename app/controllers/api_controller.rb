class ApiController < ApplicationController
  def getsections
    data = ProductSection.find_all_by_product_category_id(params[:id])
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :text => data.to_json(:only => [ :section, :id ])
  end
  
  def getsubsections
    data = ProductSubSection.find_all_by_product_section_id(params[:id])
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :text => data.to_json(:only => [ :subsection, :id ])
  end
end
