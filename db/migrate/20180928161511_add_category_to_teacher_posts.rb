class AddCategoryToTeacherPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_posts, :category, :integer
  end
end
