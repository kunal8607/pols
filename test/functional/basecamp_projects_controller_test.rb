require 'test_helper'

class BasecampProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
