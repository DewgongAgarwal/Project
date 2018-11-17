class AddColumnsToTeacherPosts < ActiveRecord::Migration[5.2]
  def change
 
      add_column :teacher_posts, :postkey, :text
      add_column :teacher_posts, :sign_id, :integer
      add_column :teacher_posts, :signature, :text
      add_column :teacher_posts, :teacherSign, :text
      
  end
end
