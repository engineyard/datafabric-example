require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get choose" do
    get :choose
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
