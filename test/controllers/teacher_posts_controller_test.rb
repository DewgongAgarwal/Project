require 'test_helper'

class TeacherPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_post = teacher_posts(:one)
  end

  test "should get index" do
    get teacher_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_post_url
    assert_response :success
  end

  test "should create teacher_post" do
    assert_difference('TeacherPost.count') do
      post teacher_posts_url, params: { teacher_post: { data: @teacher_post.data, status: @teacher_post.status, subcategory: @teacher_post.subcategory, teacher_id: @teacher_post.teacher_id } }
    end

    assert_redirected_to teacher_post_url(TeacherPost.last)
  end

  test "should show teacher_post" do
    get teacher_post_url(@teacher_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_post_url(@teacher_post)
    assert_response :success
  end

  test "should update teacher_post" do
    patch teacher_post_url(@teacher_post), params: { teacher_post: { data: @teacher_post.data, status: @teacher_post.status, subcategory: @teacher_post.subcategory, teacher_id: @teacher_post.teacher_id } }
    assert_redirected_to teacher_post_url(@teacher_post)
  end

  test "should destroy teacher_post" do
    assert_difference('TeacherPost.count', -1) do
      delete teacher_post_url(@teacher_post)
    end

    assert_redirected_to teacher_posts_url
  end
end
