module PostsHelper
  def category_img_id(category_id)
    ret = "house"
    ret = "house" if category_id == ProductCategory.find_by_category( "Недвижимость" ).id
    ret = "car" if category_id == ProductCategory.find_by_category( "Транспорт" ).id
    ret = "tehnika" if category_id == ProductCategory.find_by_category( "Предметы быта" ).id
    ret = "box" if category_id == ProductCategory.find_by_category( "Услуги" ).id
    ret = "uslugi" if category_id == ProductCategory.find_by_category( "Разное" ).id
    "#{ret}"
  end

  def location(post)
  	Location.find_by_id(post.location_id).name
  end
end
