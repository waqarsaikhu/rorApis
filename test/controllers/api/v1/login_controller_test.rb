require "test_helper"

class Api::V1::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_login_create_url
    assert_response :success
  end
end
