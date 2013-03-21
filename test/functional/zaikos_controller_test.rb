require 'test_helper'

class ZaikosControllerTest < ActionController::TestCase
  setup do
    @zaiko = zaikos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zaikos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zaiko" do
    assert_difference('Zaiko.count') do
      post :create, zaiko: { code: @zaiko.code, name: @zaiko.name, value: @zaiko.value }
    end

    assert_redirected_to zaiko_path(assigns(:zaiko))
  end

  test "should show zaiko" do
    get :show, id: @zaiko
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zaiko
    assert_response :success
  end

  test "should update zaiko" do
    put :update, id: @zaiko, zaiko: { code: @zaiko.code, name: @zaiko.name, value: @zaiko.value }
    assert_redirected_to zaiko_path(assigns(:zaiko))
  end

  test "should destroy zaiko" do
    assert_difference('Zaiko.count', -1) do
      delete :destroy, id: @zaiko
    end

    assert_redirected_to zaikos_path
  end
end
