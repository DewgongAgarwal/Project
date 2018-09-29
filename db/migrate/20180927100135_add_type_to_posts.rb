class AddTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :type, :integer
  end
end
