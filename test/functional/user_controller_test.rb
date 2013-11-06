require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get collaborators" do
    get :collaborators
    assert_response :success
  end

end
