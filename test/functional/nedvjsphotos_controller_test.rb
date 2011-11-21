require 'test_helper'

class NedvjsphotosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Nedvjsphoto.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Nedvjsphoto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Nedvjsphoto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to nedvjsphoto_url(assigns(:nedvjsphoto))
  end
  
  def test_edit
    get :edit, :id => Nedvjsphoto.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Nedvjsphoto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Nedvjsphoto.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Nedvjsphoto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Nedvjsphoto.first
    assert_redirected_to nedvjsphoto_url(assigns(:nedvjsphoto))
  end
  
  def test_destroy
    nedvjsphoto = Nedvjsphoto.first
    delete :destroy, :id => nedvjsphoto
    assert_redirected_to nedvjsphotos_url
    assert !Nedvjsphoto.exists?(nedvjsphoto.id)
  end
end
