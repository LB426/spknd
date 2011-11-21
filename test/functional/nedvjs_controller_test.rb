require 'test_helper'

class NedvjsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Nedvj.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Nedvj.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Nedvj.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to nedvj_url(assigns(:nedvj))
  end
  
  def test_edit
    get :edit, :id => Nedvj.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Nedvj.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Nedvj.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Nedvj.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Nedvj.first
    assert_redirected_to nedvj_url(assigns(:nedvj))
  end
  
  def test_destroy
    nedvj = Nedvj.first
    delete :destroy, :id => nedvj
    assert_redirected_to nedvjs_url
    assert !Nedvj.exists?(nedvj.id)
  end
end
