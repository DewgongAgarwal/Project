class CreatePostDataTable3s < ActiveRecord::Migration[5.2]
  def change
    create_table :post_data_table3s do |t|
      t.integer :post_id
      t.integer :data
      t.integer :poster_type

      t.timestamps
    end
  end
end
