require 'test_helper'

class ProductSubSectionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_sub_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_sub_section" do
    assert_difference('ProductSubSection.count') do
      post :create, :product_sub_section => { }
    end

    assert_redirected_to product_sub_section_path(assigns(:product_sub_section))
  end

  test "should show product_sub_section" do
    get :show, :id => product_sub_sections(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => product_sub_sections(:one).to_param
    assert_response :success
  end

  test "should update product_sub_section" do
    put :update, :id => product_sub_sections(:one).to_param, :product_sub_section => { }
    assert_redirected_to product_sub_section_path(assigns(:product_sub_section))
  end

  test "should destroy product_sub_section" do
    assert_difference('ProductSubSection.count', -1) do
      delete :destroy, :id => product_sub_sections(:one).to_param
    end

    assert_redirected_to product_sub_sections_path
  end
end
