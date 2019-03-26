class CreatePostDataTable2s < ActiveRecord::Migration[5.2]
  def change
    create_table :post_data_table2s do |t|
      t.integer :post_id
      t.integer :data
      t.integer :poster_type

      t.timestamps
    end
  end
end
