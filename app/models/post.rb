class Post < ActiveRecord::Base
  belongs_to :user
  has_many :postfotos, :dependent => :destroy
  has_many :post_comments, :dependent => :destroy
  cattr_reader :per_page
    @@per_page = 10
    
#  attr_accessible :user_id, :name, :content

  def self.searchbycat(category, page)
    paginate  :per_page => 10, :page => page,
              :conditions => ['category=?', "#{category}"], :order => 'created_at DESC'
  end
  
  def self.searchbyrazd(category, razdel, page)
    paginate  :per_page => 10, :page => page,
              :conditions => ['category=? AND razdel=?', "#{category}","#{razdel}"], :order => 'updated_at DESC'
  end
  
  def self.searchbyNameAndContent(param,page)
    param = param.gsub(/"|'|\\|\/|\$|\.|\,|\:|\!|\?|\*|\@|\&|\%|\#|\^|\(|\)/,"")
    words = param.split
    words.reverse!
    wr1 = words.join("%' UNION select * from posts where name like '%")
    wr2 = words.join("%' UNION select * from posts where content like '%")
    r1 = "select * from posts where name like '%#{wr1}%'"
    r2 = "select * from posts where content like '%#{wr2}%'"
    sql = "#{r1} UNION #{r2}"
    paginate_by_sql sql, :page => page, :per_page => 10
  end

  validates_each :razdel, :category do | record, attr, value |
    record.errors.add attr, "не указан!" if value == 0
  end

  validates_presence_of :name, :content 

#, :message => 'нужно принять соглашение'
  
  def self.getpostpage(post, userid)
    countposts = Post.count_by_sql "SELECT COUNT(*) FROM posts WHERE category = #{post.category}"
    pages = countposts / @@per_page
    page = post.id / @@per_page
    if page == 0
      pagenum = pages
    else
      pagenum = pages - page
    end
    return pagenum
  end

end
