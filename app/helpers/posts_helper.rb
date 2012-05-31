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

  def rooms(post)
    res = nil
    unless post.options.nil?
      unless post.options.empty?
        res = post.options['rooms'] if post.options['rooms'] != ""
      end
    end
    res
  end

  def floor(post)
    res = "—/—"
    unless post.options.nil?
      unless post.options.empty?
        if post.options['floor'] != "" && post.options['floor'] != "—/—"
          res = post.options['floor']
        end
      end
    end
    res
  end

  def square(post)
    res = nil
    unless post.options.nil?
      unless post.options['square'].nil?
        res = post.options['square']
      end
    end
    res
  end

  def livingspace(post)
    res = nil
    unless post.options.nil?
      unless post.options['living_space'].nil?
        if post.options['living_space'] != ""
          res = post.options['living_space']
        end
      end
    end
    res
  end

  def contact_phone(post)
    res = nil
    unless post.options.nil?
      unless post.options.empty?
        res = post.options['tel_num']
      end
    end
    res
  end

  def contact_email(post)
    res = nil
    unless post.options.nil?
      unless post.options['email'].nil?
        if post.options['email'] != ""
          res = post.options['email']
        end
      end
    end
    res
  end

  def contact_other(post)
    res = nil
    unless post.options.nil?
      unless post.options.empty?
        res = post.options['other_contact']
      end
    end
    res
  end

  def pricecomment(post)
    res = '<option value="рубли">рубли</option><option value="рубли, торг уместен">рубли, торг уместен</option><option value="доллары">доллары</option>'
    res
  end

  def ploshad_obshaya_jilaya(post)
    res = ""
    if livingspace(post) != nil
      res = "&nbsp;| Площадь общ. <b>#{square(post)}м²</b> жилая:&nbsp;<b>#{livingspace(post)}м²</b>"
    end
    res
  end

  def jilyh_komnat(post)
    res = ""
    if rooms(post) != nil
      res = "&nbsp;| Жилых комнат:&nbsp;<b>#{rooms(post)}</b>"
    end
    res
  end

  def etaj(post)
    res = ""
    if floor(post) != "—/—"
      res = "&nbsp;|Этаж:&nbsp;<b>#{floor(post)}</b>"
    end
    res
  end

  def contact(post)
    res = ""
    if contact_phone(post) != nil 
      res = "тел. <b>#{contact_phone(post)}</b>"
    end
    if contact_email(post) != nil
      res = "#{res} email: <b>#{contact_email(post)}</b>"
    end
    res
  end

end
