require 'test_helper'

class PostfotosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Postfoto.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Postfoto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Postfoto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to postfoto_url(assigns(:postfoto))
  end
  
  def test_edit
    get :edit, :id => Postfoto.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Postfoto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Postfoto.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Postfoto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Postfoto.first
    assert_redirected_to postfoto_url(assigns(:postfoto))
  end
  
  def test_destroy
    postfoto = Postfoto.first
    delete :destroy, :id => postfoto
    assert_redirected_to postfotos_url
    assert !Postfoto.exists?(postfoto.id)
  end
end
