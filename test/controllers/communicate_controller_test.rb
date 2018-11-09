require 'test_helper'

class CommunicateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get communicate_index_url
    assert_response :success
  end

end
