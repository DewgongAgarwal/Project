class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :stud_id
      t.integer :category
      t.integer :subcategory
      t.text :data
      t.integer :status

      t.timestamps
    end
  end
end
