require 'test_helper'

class SalesmeisControllerTest < ActionController::TestCase
  setup do
    @salesmei = salesmeis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salesmeis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salesmei" do
    assert_difference('Salesmei.count') do
      post :create, salesmei: { billno: @salesmei.billno, itemcode: @salesmei.itemcode, itemprice: @salesmei.itemprice, value: @salesmei.value }
    end

    assert_redirected_to salesmei_path(assigns(:salesmei))
  end

  test "should show salesmei" do
    get :show, id: @salesmei
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salesmei
    assert_response :success
  end

  test "should update salesmei" do
    put :update, id: @salesmei, salesmei: { billno: @salesmei.billno, itemcode: @salesmei.itemcode, itemprice: @salesmei.itemprice, value: @salesmei.value }
    assert_redirected_to salesmei_path(assigns(:salesmei))
  end

  test "should destroy salesmei" do
    assert_difference('Salesmei.count', -1) do
      delete :destroy, id: @salesmei
    end

    assert_redirected_to salesmeis_path
  end
end
