class AddStudentSignToPosts < ActiveRecord::Migration[5.2]
  def change
      add_column :posts, :studentSign, :text
  end
end
