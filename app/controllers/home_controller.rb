class HomeController < ApplicationController
  def index
    ids = Postfoto.find_by_sql("select distinct post_id from postfotos order by post_id desc limit 4;")
    if ids.size > 3
      @post = Post.find_by_sql("select * from posts where id=#{ids[0].post_id} OR id=#{ids[1].post_id} OR id=#{ids[2].post_id} order by id desc;")
    else
      @post = Post.find(:all, :conditions => ["category = ?", "1"], :limit => 3, :order => 'id desc' )
    end
  end

end
