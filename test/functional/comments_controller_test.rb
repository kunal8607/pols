require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get persist" do
    get :persist
    assert_response :success
  end

end
