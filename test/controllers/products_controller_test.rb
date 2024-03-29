require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @product = products(:one)
    #@request.env["devise.mapping"] = Devise.mappings[:admin]
    #sign_in FactoryGirl.create(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { admin_id: @product.admin_id, category_id: @product.category_id, cover: @product.cover, description: @product.description, name: @product.name, price: @product.price }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { admin_id: @product.admin_id, category_id: @product.category_id, cover: @product.cover, description: @product.description, name: @product.name, price: @product.price }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
  FactoryGirl.define do
    factory :account do
      email { Faker::Internet.email }
      password "password"
      password_confirmation "password"
      confirmed_at Date.today
    end
  end
end
