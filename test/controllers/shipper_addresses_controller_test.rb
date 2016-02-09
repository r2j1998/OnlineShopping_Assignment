require 'test_helper'

class ShipperAddressesControllerTest < ActionController::TestCase
  setup do
    @shipper_address = shipper_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipper_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipper_address" do
    assert_difference('ShipperAddress.count') do
      post :create, shipper_address: { city: @shipper_address.city, country: @shipper_address.country, district: @shipper_address.district, pincode: @shipper_address.pincode, state: @shipper_address.state }
    end

    assert_redirected_to shipper_address_path(assigns(:shipper_address))
  end

  test "should show shipper_address" do
    get :show, id: @shipper_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipper_address
    assert_response :success
  end

  test "should update shipper_address" do
    patch :update, id: @shipper_address, shipper_address: { city: @shipper_address.city, country: @shipper_address.country, district: @shipper_address.district, pincode: @shipper_address.pincode, state: @shipper_address.state }
    assert_redirected_to shipper_address_path(assigns(:shipper_address))
  end

  test "should destroy shipper_address" do
    assert_difference('ShipperAddress.count', -1) do
      delete :destroy, id: @shipper_address
    end

    assert_redirected_to shipper_addresses_path
  end
end
