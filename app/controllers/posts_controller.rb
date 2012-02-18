class PostsController < ApplicationController
  def index
    page = params[:page] || 1

    @categories = ProductCategory.all( :order => 'id ASC' )

    @location_id = "all"
    @category_id = "all"
    @section_id = "all"
    @subsection_id = "all"
    unless params['location'].nil?
      unless params['location'].empty?
        @location_id = Location.find(params['location']).id
      end
    end
    unless params['location_id'].nil?
      unless params['location_id'].empty?
        if params['location_id'] != "all"
          @location_id = params['location_id']
        end
      end
    end
    unless params['category_id'].nil?
      unless params['category_id'].empty?
        @category_id = params['category_id']
      end
    end
    unless params['section_id'].nil?
      unless params['section_id'].empty?
        @section_id = params['section_id']
      end
    end
    unless params['subsection_id'].nil?
      unless params['subsection_id'].empty?
        @subsection_id = params['subsection_id']
      end
    end
    
    case "#{@location_id}+#{@category_id}+#{@section_id}+#{@subsection_id}"
    when /all\+\d\+all\+all/
      @posts = Post.paginate_by_category @category_id, :page => page, :order => 'created_at DESC'
    when /all\+\d\+\d\+all/
      @posts = Post.search_by_category_and_section(@category_id, @section_id, page)
    when /all\+\d\+\d\+\d/
      @posts = Post.search_by_category_and_section_and_subsection(@category_id, @section_id, @subsection_id, page)
    when /\d\+all\+all\+all/
      @posts = Post.paginate_by_location_id @location_id, :page => page, :order => 'created_at DESC'
    when /\d\+\d\+all\+all/
      @posts = Post.search_by_location_and_category(@location_id, @category_id, page)
    when /\d\+\d\+\d\+all/
      @posts = Post.search_by_location_and_category_and_section(@location_id, @category_id, @section_id, page)
    when /\d\+\d\+\d\+\d/
      @posts = Post.search_by_location_and_category_and_section_and_subsection(@location_id, @category_id, @section_id, @subsection_id, page)
    else
      @category = ProductCategory.find_by_category( "Недвижимость", :order => 'id ASC')
      @posts = Post.paginate_by_location_id @category.id, :page => page, :order => 'created_at DESC'
    end
    
  end
  
  def show
    @category = params[:id]
    page = params[:page] || 1
    case @category
    when /nedvjs/
        @posts = Post.searchbycat(1,page)
    when /kvarts/
        @posts = Post.searchbyrazd(1,1,page)
    when /domovlden/
        @posts = Post.searchbyrazd(1,2,page)
    when /kommers/
        @posts = Post.searchbyrazd(1,3,page)
    when /zemuch/
        @posts = Post.searchbyrazd(1,4,page)
    when /arenda/
        @posts = Post.searchbyrazd(1,5,page)
    when /autos/
        @posts = Post.searchbycat(2,page)
    when /legkovye/
        @posts = Post.searchbyrazd(2,1,page)
    when /gruzov/
        @posts = Post.searchbyrazd(2,2,page)
    when /remont/
        @posts = Post.searchbyrazd(2,3,page)
    when /tuning/
        @posts = Post.searchbyrazd(2,4,page)
    when /moto/
        @posts = Post.searchbyrazd(2,5,page)
    when /appliances/
        @posts = Post.searchbycat(3,page)
    when /video/
        @posts = Post.searchbyrazd(3,1,page)
    when /kitchen/
        @posts = Post.searchbyrazd(3,2,page)
    when /wanny/
        @posts = Post.searchbyrazd(3,3,page)
    when /refreg/
        @posts = Post.searchbyrazd(3,4,page)
    when /computers/
        @posts = Post.searchbyrazd(3,5,page)
    when /uslugi/
        @posts = Post.searchbycat(4,page)
    when /building/
        @posts = Post.searchbyrazd(4,1,page)
    when /medical/
        @posts = Post.searchbyrazd(4,2,page)
    when /style/
        @posts = Post.searchbyrazd(4,3,page)
    when /ads/
        @posts = Post.searchbyrazd(4,4,page)
    when /clubs/
        @posts = Post.searchbyrazd(4,5,page)
    when /raznoe/
        @posts = Post.searchbycat(5,page)
    when /igrushki/
        @posts = Post.searchbyrazd(5,1,page)
    when /razvlekalovo/
        @posts = Post.searchbyrazd(5,2,page)
    when /zivotnye/
        @posts = Post.searchbyrazd(5,3,page)
    when /ucheba/
        @posts = Post.searchbyrazd(5,4,page)
    when /ostalnoe/
        @posts = Post.searchbyrazd(5,5,page)
    when /show/
        unless params[:search].nil?
          @posts = Post.searchbyNameAndContent( params[:search], page)
        else
          redirect_to posts_path
          flash[:notice] = "вы ничего не ввели в поле поиска"
        end
    else
        redirect_to posts_path
    end
  end
  
  def new
    @locations = Location.all(:select => "id, name", :order => 'id ASC')
    
    null_category = [ {'category'=>'выберите категорию', 'id'=>0} ].map!{|x| [ x["category"], x["id"] ] }
    @categories = null_category + ProductCategory.all(:select => "id, category", :order => 'id ASC').map {|x| [ x.category, x.id ] }
    null_sections = [ {'section'=>'выберите раздел', 'id'=>0} ].map!{|x| [ x["section"], x["id"] ] }
    @sections = null_sections + ProductSection.all(:select => "id, section", :order => 'id ASC').map!{|x| [ x.section, x.id ] }
    null_subsections = [ {'subsection'=>'выберите подраздел', 'id'=>0} ].map!{|x| [ x["subsection"], x["id"] ] }
    @subsections = null_subsections + ProductSubSection.all(:select => "id, subsection", :order => 'id ASC').map!{|x| [ x.subsection, x.id ] }
    
    @post = current_user.posts.new
    @postfoto = @post.postfotos.new
    if "1" == params[:id] || "2" == params[:id] || "3" == params[:id] || "4" == params[:id] || "5" == params[:id]
      data = Catandrazd.find_all_by_cat_id(params[:id])
      response.headers['Content-type'] = "text/plain; charset=utf-8"
      render :text => data.to_json(:only => [ :razdel, :razd_id ])
    end
    
    rescue => err
      flash[:notice] = "Вы не авторизованы, зарегистрируйтесь пожалуйста!"
      redirect_to login_path
  end
  
  def create
    @post = current_user.posts.create(params[:post])
    
    if @post.save
      flash[:notice] = "Successfully created post."
      if params[:postfoto] != nil
        @postfoto = @post.postfotos.new(params[:postfoto])
        @postfoto.user_id = current_user
        if @postfoto.save
          flash[:notice] = "Фотография успешно добавлена."
        else
          flash[:notice] = "NO Successfully created postfoto."
        end
      end
      respond_to do |format|
          #format.html { redirect_to @post }
          flash[:notice] = "Объявление успешно добавлено."
          format.html { redirect_to edit_post_path(@post) }
          format.js
      end
    else
      render :action => 'new'
    end
    
    rescue => err
      flash[:notice] = "#{err}"
      redirect_to posts_path
  end
  
  def edit
    if /manager/ =~ current_user.groups
      @post = Post.find(params[:id])
    else
      @post = current_user.posts.find(params[:id])
    end
    @postfoto = @post.postfotos.new
    @postfotos = @post.postfotos.find(:all)
    
    rescue => err
      flash[:notice] = "Authorised PLEASE!!!#{err}"
      redirect_to login_path
  end
  
  def update
    if /manager/ =~ current_user.groups
      @post = Post.find(params[:id])
    else
      @post = current_user.posts.find(params[:id])
    end
    
    if @post.update_attributes(params[:post])
      if params[:postfoto] != nil 
        @postfoto = @post.postfotos.new(params[:postfoto])
        @postfoto.user_id = current_user
        if @postfoto.save
          flash[:notice] = "Successfully created postfoto."
        else
          flash[:notice] = "NO Successfully created postfoto."
        end
      end
      flash[:notice] = "Successfully updated post."
      #redirect_to @post
      redirect_to edit_post_path(@post)
    else
      render :action => 'edit'
    end
    
    rescue => err
      flash[:notice] = "Authorised PLEASE!!!#{err}"
      redirect_to login_path
  end
  
  def destroy
    if /manager/ =~ current_user.groups
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "Successfully destroyed post."
      redirect_to posts_path
    else
      @post = current_user.posts.find(params[:id])
      @post.destroy
      flash[:notice] = "Successfully destroyed post."
      redirect_to profile_path
    end
    
    rescue => err
      flash[:notice] = "Authorised PLEASE!!!#{err}"
      redirect_to login_path
  end
  
  def showsinglepost
    @posts = Post.find_all_by_id(params[:id])
    page = params[:page] || 1
  end
  
end
