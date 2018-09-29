class CreateTeacherPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_posts do |t|
      t.integer :teacher_id
      t.text :data
      t.integer :subcategory
      t.integer :status

      t.timestamps
    end
  end
end
