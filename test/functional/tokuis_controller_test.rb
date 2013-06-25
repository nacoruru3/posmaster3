require 'test_helper'

class TokuisControllerTest < ActionController::TestCase
  setup do
    @tokui = tokuis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tokuis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tokui" do
    assert_difference('Tokui.count') do
      post :create, tokui: { code: @tokui.code, name: @tokui.name, tokui1bun: @tokui.tokui1bun }
    end

    assert_redirected_to tokui_path(assigns(:tokui))
  end

  test "should show tokui" do
    get :show, id: @tokui
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tokui
    assert_response :success
  end

  test "should update tokui" do
    put :update, id: @tokui, tokui: { code: @tokui.code, name: @tokui.name, tokui1bun: @tokui.tokui1bun }
    assert_redirected_to tokui_path(assigns(:tokui))
  end

  test "should destroy tokui" do
    assert_difference('Tokui.count', -1) do
      delete :destroy, id: @tokui
    end

    assert_redirected_to tokuis_path
  end
end
