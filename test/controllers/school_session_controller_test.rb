require 'test_helper'

class SchoolSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get school_session_new_url
    assert_response :success
  end

  test "should get create" do
    get school_session_create_url
    assert_response :success
  end

  test "should get destroy" do
    get school_session_destroy_url
    assert_response :success
  end

end
