# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Location.create( :name => 'Тихорецк', :form => 'город' )

n = ProductCategory.create( :category => 'Недвижимость' )
s = ProductSection.create(  :section => 'Квартиры', :product_category_id => n.id )
  ProductSubSection.create(  :subsection => 'Новостройки', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Комнаты', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => '1 комнатные', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => '2-х комнатные', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => '3-х и более комнатные', :product_category_id => n.id, :product_section_id => s.id ) 
s = ProductSection.create(  :section => 'Домовладения', :product_category_id => n.id )
  ProductSubSection.create(  :subsection => 'до 50 м²', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'до 100 м²', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => 'до 150 м²', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'до 300 м²', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => 'свыше 300 м²', :product_category_id => n.id, :product_section_id => s.id )    
s = ProductSection.create(  :section => 'Участки, дачи, гаражи', :product_category_id => n.id )
  ProductSubSection.create(  :subsection => 'Участки', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Дачи', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => 'Гаражи', :product_category_id => n.id, :product_section_id => s.id ) 
s = ProductSection.create(  :section => 'Комерческая', :product_category_id => n.id )
  ProductSubSection.create(  :subsection => 'Магазины', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Офисы', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => 'Склады', :product_category_id => n.id, :product_section_id => s.id ) 
  ProductSubSection.create(  :subsection => 'Прочее', :product_category_id => n.id, :product_section_id => s.id )                                   
s = ProductSection.create(  :section => 'Аренда', :product_category_id => n.id )
  ProductSubSection.create( :subsection => 'Квартиры', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Домовладения', :product_category_id => n.id, :product_section_id => s.id )                                
  ProductSubSection.create(  :subsection => 'Гаражи', :product_category_id => n.id, :product_section_id => s.id ) 
  ProductSubSection.create(  :subsection => 'Офисы', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Магазины', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Склады', :product_category_id => n.id, :product_section_id => s.id )
  ProductSubSection.create(  :subsection => 'Прочее', :product_category_id => n.id, :product_section_id => s.id )                               
                                                                                             