require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get view_students" do
    get :view_students
    assert_response :success
  end

  test "should get view_instructors" do
    get :view_instructors
    assert_response :success
  end

end
