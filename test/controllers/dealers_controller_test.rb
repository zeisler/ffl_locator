require 'test_helper'

class DealersControllerTest < ActionController::TestCase
  setup do
    @dealer = dealers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dealers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dealer" do
    assert_difference('Dealer.count') do
      post :create, dealer: { business_name: @dealer.business_name, lat: @dealer.lat, license_name: @dealer.license_name, license_id: @dealer.license_id, lng: @dealer.lng, state: @dealer.state, street: @dealer.street, zip_code: @dealer.zip_code }
    end

    assert_redirected_to dealer_path(assigns(:dealer))
  end

  test "should show dealer" do
    get :show, id: @dealer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dealer
    assert_response :success
  end

  test "should update dealer" do
    patch :update, id: @dealer, dealer: { business_name: @dealer.business_name, lat: @dealer.lat, license_name: @dealer.license_name, license_id: @dealer.license_id, lng: @dealer.lng, state: @dealer.state, street: @dealer.street, zip_code: @dealer.zip_code }
    assert_redirected_to dealer_path(assigns(:dealer))
  end

  test "should destroy dealer" do
    assert_difference('Dealer.count', -1) do
      delete :destroy, id: @dealer
    end

    assert_redirected_to dealers_path
  end

  test "should get nearest point with x radius" do
    get :find_near, coordinates: "45, -122", json
    assert_response :success

  end
end
