require 'test_helper'

class InterestedUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get interested_users_create_url
    assert_response :success
  end

end
