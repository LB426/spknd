require 'test_helper'

class ProductSectionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_section" do
    assert_difference('ProductSection.count') do
      post :create, :product_section => { }
    end

    assert_redirected_to product_section_path(assigns(:product_section))
  end

  test "should show product_section" do
    get :show, :id => product_sections(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => product_sections(:one).to_param
    assert_response :success
  end

  test "should update product_section" do
    put :update, :id => product_sections(:one).to_param, :product_section => { }
    assert_redirected_to product_section_path(assigns(:product_section))
  end

  test "should destroy product_section" do
    assert_difference('ProductSection.count', -1) do
      delete :destroy, :id => product_sections(:one).to_param
    end

    assert_redirected_to product_sections_path
  end
end
