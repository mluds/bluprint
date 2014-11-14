require 'test_helper'

class AuthorableProblemsControllerTest < ActionController::TestCase
  test "should get view_current_user" do
    get :view_current_user
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
