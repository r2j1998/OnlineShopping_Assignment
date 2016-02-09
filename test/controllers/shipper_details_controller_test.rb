require 'test_helper'

class ShipperDetailsControllerTest < ActionController::TestCase
  setup do
    @shipper_detail = shipper_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipper_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipper_detail" do
    assert_difference('ShipperDetail.count') do
      post :create, shipper_detail: { email: @shipper_detail.email, fname: @shipper_detail.fname, lname: @shipper_detail.lname, mobile_no: @shipper_detail.mobile_no, shipper_address_id: @shipper_detail.shipper_address_id }
    end

    assert_redirected_to shipper_detail_path(assigns(:shipper_detail))
  end

  test "should show shipper_detail" do
    get :show, id: @shipper_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipper_detail
    assert_response :success
  end

  test "should update shipper_detail" do
    patch :update, id: @shipper_detail, shipper_detail: { email: @shipper_detail.email, fname: @shipper_detail.fname, lname: @shipper_detail.lname, mobile_no: @shipper_detail.mobile_no, shipper_address_id: @shipper_detail.shipper_address_id }
    assert_redirected_to shipper_detail_path(assigns(:shipper_detail))
  end

  test "should destroy shipper_detail" do
    assert_difference('ShipperDetail.count', -1) do
      delete :destroy, id: @shipper_detail
    end

    assert_redirected_to shipper_details_path
  end
end
