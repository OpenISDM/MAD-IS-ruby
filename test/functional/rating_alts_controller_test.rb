require 'test_helper'

class RatingAltsControllerTest < ActionController::TestCase
  setup do
    @rating_alt = rating_alts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_alts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_alt" do
    assert_difference('RatingAlt.count') do
      post :create, rating_alt: {  }
    end

    assert_redirected_to rating_alt_path(assigns(:rating_alt))
  end

  test "should show rating_alt" do
    get :show, id: @rating_alt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_alt
    assert_response :success
  end

  test "should update rating_alt" do
    put :update, id: @rating_alt, rating_alt: {  }
    assert_redirected_to rating_alt_path(assigns(:rating_alt))
  end

  test "should destroy rating_alt" do
    assert_difference('RatingAlt.count', -1) do
      delete :destroy, id: @rating_alt
    end

    assert_redirected_to rating_alts_path
  end
end
