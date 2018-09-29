require 'test_helper'

class SchoolViewTeacherPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get school_view_teacher_posts_show_url
    assert_response :success
  end

end
