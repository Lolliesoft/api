require 'test_helper'

class ApiDashboardsControllerTest < ActionController::TestCase
  setup do
    @api_dashboard = api_dashboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_dashboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_dashboard" do
    assert_difference('ApiDashboard.count') do
      post :create, :api_dashboard => @api_dashboard.attributes
    end

    assert_redirected_to api_dashboard_path(assigns(:api_dashboard))
  end

  test "should show api_dashboard" do
    get :show, :id => @api_dashboard.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @api_dashboard.to_param
    assert_response :success
  end

  test "should update api_dashboard" do
    put :update, :id => @api_dashboard.to_param, :api_dashboard => @api_dashboard.attributes
    assert_redirected_to api_dashboard_path(assigns(:api_dashboard))
  end

  test "should destroy api_dashboard" do
    assert_difference('ApiDashboard.count', -1) do
      delete :destroy, :id => @api_dashboard.to_param
    end

    assert_redirected_to api_dashboards_path
  end
end
