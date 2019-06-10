class ChangeSignerIdToTextInPosts < ActiveRecord::Migration[5.2]
  def change

      change_column :posts, :sign_id, :text
      
  end
end
