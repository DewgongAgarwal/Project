require "application_system_test_case"

class TeacherPostsTest < ApplicationSystemTestCase
  setup do
    @teacher_post = teacher_posts(:one)
  end

  test "visiting the index" do
    visit teacher_posts_url
    assert_selector "h1", text: "Teacher Posts"
  end

  test "creating a Teacher post" do
    visit teacher_posts_url
    click_on "New Teacher Post"

    fill_in "Data", with: @teacher_post.data
    fill_in "Status", with: @teacher_post.status
    fill_in "Subcategory", with: @teacher_post.subcategory
    fill_in "Teacher", with: @teacher_post.teacher_id
    click_on "Create Teacher post"

    assert_text "Teacher post was successfully created"
    click_on "Back"
  end

  test "updating a Teacher post" do
    visit teacher_posts_url
    click_on "Edit", match: :first

    fill_in "Data", with: @teacher_post.data
    fill_in "Status", with: @teacher_post.status
    fill_in "Subcategory", with: @teacher_post.subcategory
    fill_in "Teacher", with: @teacher_post.teacher_id
    click_on "Update Teacher post"

    assert_text "Teacher post was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher post" do
    visit teacher_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher post was successfully destroyed"
  end
end
