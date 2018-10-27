require 'test_helper'

class SetKeyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get set_key_index_url
    assert_response :success
  end

end
