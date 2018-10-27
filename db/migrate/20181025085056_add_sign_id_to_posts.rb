class AddSignIdToPosts < ActiveRecord::Migration[5.2]
  def change
      add_column :posts, :sign_id, :integer
      add_column :posts, :signature, :text
  end
end
