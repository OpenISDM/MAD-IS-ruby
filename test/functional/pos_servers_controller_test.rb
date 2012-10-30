require 'test_helper'

class PosServersControllerTest < ActionController::TestCase
  setup do
    @pos_server = pos_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pos_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pos_server" do
    assert_difference('PosServer.count') do
      post :create, pos_server: { ip: @pos_server.ip, lat: @pos_server.lat, lon: @pos_server.lon, region: @pos_server.region, server_id: @pos_server.server_id }
    end

    assert_redirected_to pos_server_path(assigns(:pos_server))
  end

  test "should show pos_server" do
    get :show, id: @pos_server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pos_server
    assert_response :success
  end

  test "should update pos_server" do
    put :update, id: @pos_server, pos_server: { ip: @pos_server.ip, lat: @pos_server.lat, lon: @pos_server.lon, region: @pos_server.region, server_id: @pos_server.server_id }
    assert_redirected_to pos_server_path(assigns(:pos_server))
  end

  test "should destroy pos_server" do
    assert_difference('PosServer.count', -1) do
      delete :destroy, id: @pos_server
    end

    assert_redirected_to pos_servers_path
  end
end
