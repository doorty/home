require 'test_helper'

class CareCirclesControllerTest < ActionController::TestCase
  setup do
    @care_circle = care_circles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:care_circles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create care_circle" do
    assert_difference('CareCircle.count') do
      post :create, care_circle: {  }
    end

    assert_redirected_to care_circle_path(assigns(:care_circle))
  end

  test "should show care_circle" do
    get :show, id: @care_circle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @care_circle
    assert_response :success
  end

  test "should update care_circle" do
    patch :update, id: @care_circle, care_circle: {  }
    assert_redirected_to care_circle_path(assigns(:care_circle))
  end

  test "should destroy care_circle" do
    assert_difference('CareCircle.count', -1) do
      delete :destroy, id: @care_circle
    end

    assert_redirected_to care_circles_path
  end
end
