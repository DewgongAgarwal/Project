class AddColumnToPostDataTables < ActiveRecord::Migration[5.2]
  def change
      
      add_column :post_data_table1s, :y, :text
      add_column :post_data_table2s, :y, :text
      add_column :post_data_table3s, :y, :text
      add_column :post_data_table4s, :y, :text
      add_column :post_data_table5s, :y, :text
      
      
  end
end
