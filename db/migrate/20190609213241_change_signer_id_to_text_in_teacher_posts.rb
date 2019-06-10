class ChangeSignerIdToTextInTeacherPosts < ActiveRecord::Migration[5.2]
  def change
      
      change_column :teacher_posts, :sign_id, :text
      
  end
end
