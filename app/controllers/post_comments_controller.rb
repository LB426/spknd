class PostCommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments.all(:order => 'updated_at ASC')
    @post_comment = @post.post_comments.new
  end
  
  def show
    @post_comment = PostComment.find(params[:id])
  end
  
  def new
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(params[:post_comment])
    if current_user
      @post_comment.user_id = current_user.id
    else
      @post_comment.user_id = 3
    end
    if @post_comment.save
      flash[:notice] = "Комментарий к объявлению успешно добавлен."
      redirect_to post_post_comments_path(@post)
    else
      redirect_to post_post_comments_path(@post)
    end
  end
  
  def edit
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find(params[:id])
  end
  
  def update
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update_attributes(params[:post_comment])
      flash[:notice] = "Комментарий к объявлению успешно обновлён."
      redirect_to @post_comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    if /manager/ =~ current_user.groups
      @post_comment = PostComment.find(params[:id])
      @post_comment.destroy
      flash[:notice] = "Комментарий к объявлению успешно удалён."
      redirect_to post_post_comments_path(@post)
    else
      redirect_to post_post_comments_path(@post)
    end
  end
end
