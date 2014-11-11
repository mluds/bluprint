require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  test "should get view_current_user" do
    get :view_current_user
    assert_response :success
  end

end
