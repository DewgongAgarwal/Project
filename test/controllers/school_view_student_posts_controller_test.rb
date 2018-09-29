require 'test_helper'

class SchoolViewStudentPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get school_view_student_posts_show_url
    assert_response :success
  end

end
