require 'test_helper'

class PostCommentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => PostComment.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    PostComment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    PostComment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to post_comment_url(assigns(:post_comment))
  end
  
  def test_edit
    get :edit, :id => PostComment.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    PostComment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PostComment.first
    assert_template 'edit'
  end
  
  def test_update_valid
    PostComment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PostComment.first
    assert_redirected_to post_comment_url(assigns(:post_comment))
  end
  
  def test_destroy
    post_comment = PostComment.first
    delete :destroy, :id => post_comment
    assert_redirected_to post_comments_url
    assert !PostComment.exists?(post_comment.id)
  end
end
