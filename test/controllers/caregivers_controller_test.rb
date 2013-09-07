require 'test_helper'

class CaregiversControllerTest < ActionController::TestCase
  setup do
    @caregiver = caregivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caregivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caregiver" do
    assert_difference('Caregiver.count') do
      post :create, caregiver: { age: @caregiver.age, bonded: @caregiver.bonded, city: @caregiver.city, description: @caregiver.description, email: @caregiver.email, insured: @caregiver.insured, name: @caregiver.name, occupation: @caregiver.occupation, reviewed: @caregiver.reviewed, state: @caregiver.state, years_of_experience: @caregiver.years_of_experience, zip: @caregiver.zip }
    end

    assert_redirected_to caregiver_path(assigns(:caregiver))
  end

  test "should show caregiver" do
    get :show, id: @caregiver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caregiver
    assert_response :success
  end

  test "should update caregiver" do
    patch :update, id: @caregiver, caregiver: { age: @caregiver.age, bonded: @caregiver.bonded, city: @caregiver.city, description: @caregiver.description, email: @caregiver.email, insured: @caregiver.insured, name: @caregiver.name, occupation: @caregiver.occupation, reviewed: @caregiver.reviewed, state: @caregiver.state, years_of_experience: @caregiver.years_of_experience, zip: @caregiver.zip }
    assert_redirected_to caregiver_path(assigns(:caregiver))
  end

  test "should destroy caregiver" do
    assert_difference('Caregiver.count', -1) do
      delete :destroy, id: @caregiver
    end

    assert_redirected_to caregivers_path
  end
end
