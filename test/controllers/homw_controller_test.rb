require "test_helper"

class HomwControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homw_index_url
    assert_response :success
  end
end
