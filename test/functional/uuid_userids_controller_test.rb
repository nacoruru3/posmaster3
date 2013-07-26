require 'test_helper'

class UuidUseridsControllerTest < ActionController::TestCase
  setup do
    @uuid_userid = uuid_userids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uuid_userids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uuid_userid" do
    assert_difference('UuidUserid.count') do
      post :create, uuid_userid: { userid: @uuid_userid.userid, uuid: @uuid_userid.uuid }
    end

    assert_redirected_to uuid_userid_path(assigns(:uuid_userid))
  end

  test "should show uuid_userid" do
    get :show, id: @uuid_userid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uuid_userid
    assert_response :success
  end

  test "should update uuid_userid" do
    put :update, id: @uuid_userid, uuid_userid: { userid: @uuid_userid.userid, uuid: @uuid_userid.uuid }
    assert_redirected_to uuid_userid_path(assigns(:uuid_userid))
  end

  test "should destroy uuid_userid" do
    assert_difference('UuidUserid.count', -1) do
      delete :destroy, id: @uuid_userid
    end

    assert_redirected_to uuid_userids_path
  end
end
