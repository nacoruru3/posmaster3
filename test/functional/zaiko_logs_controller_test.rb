require 'test_helper'

class ZaikoLogsControllerTest < ActionController::TestCase
  setup do
    @zaiko_log = zaiko_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zaiko_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zaiko_log" do
    assert_difference('ZaikoLog.count') do
      post :create, zaiko_log: { code: @zaiko_log.code, value: @zaiko_log.value }
    end

    assert_redirected_to zaiko_log_path(assigns(:zaiko_log))
  end

  test "should show zaiko_log" do
    get :show, id: @zaiko_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zaiko_log
    assert_response :success
  end

  test "should update zaiko_log" do
    put :update, id: @zaiko_log, zaiko_log: { code: @zaiko_log.code, value: @zaiko_log.value }
    assert_redirected_to zaiko_log_path(assigns(:zaiko_log))
  end

  test "should destroy zaiko_log" do
    assert_difference('ZaikoLog.count', -1) do
      delete :destroy, id: @zaiko_log
    end

    assert_redirected_to zaiko_logs_path
  end
end
