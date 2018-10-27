class AddPostKeyToPosts < ActiveRecord::Migration[5.2]
  def change
       add_column :Posts, :postkey, :text
  end
end
