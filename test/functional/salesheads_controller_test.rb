require 'test_helper'

class SalesheadsControllerTest < ActionController::TestCase
  setup do
    @saleshead = salesheads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salesheads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saleshead" do
    assert_difference('Saleshead.count') do
      post :create, saleshead: { billno: @saleshead.billno, custno: @saleshead.custno, date: @saleshead.date, price: @saleshead.price, tokui_id: @saleshead.tokui_id }
    end

    assert_redirected_to saleshead_path(assigns(:saleshead))
  end

  test "should show saleshead" do
    get :show, id: @saleshead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saleshead
    assert_response :success
  end

  test "should update saleshead" do
    put :update, id: @saleshead, saleshead: { billno: @saleshead.billno, custno: @saleshead.custno, date: @saleshead.date, price: @saleshead.price, tokui_id: @saleshead.tokui_id }
    assert_redirected_to saleshead_path(assigns(:saleshead))
  end

  test "should destroy saleshead" do
    assert_difference('Saleshead.count', -1) do
      delete :destroy, id: @saleshead
    end

    assert_redirected_to salesheads_path
  end
end
