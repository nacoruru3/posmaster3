require 'test_helper'

class Sho1bunsControllerTest < ActionController::TestCase
  setup do
    @sho1bun = sho1buns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sho1buns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sho1bun" do
    assert_difference('Sho1bun.count') do
      post :create, sho1bun: { code: @sho1bun.code, name: @sho1bun.name }
    end

    assert_redirected_to sho1bun_path(assigns(:sho1bun))
  end

  test "should show sho1bun" do
    get :show, id: @sho1bun
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sho1bun
    assert_response :success
  end

  test "should update sho1bun" do
    put :update, id: @sho1bun, sho1bun: { code: @sho1bun.code, name: @sho1bun.name }
    assert_redirected_to sho1bun_path(assigns(:sho1bun))
  end

  test "should destroy sho1bun" do
    assert_difference('Sho1bun.count', -1) do
      delete :destroy, id: @sho1bun
    end

    assert_redirected_to sho1buns_path
  end
end
