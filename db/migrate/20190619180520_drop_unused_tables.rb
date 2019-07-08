class DropUnusedTables < ActiveRecord::Migration[5.2]
  def change
      
      drop_table :post_table1
      drop_table :post_table1s
      drop_table :data_table1s
      drop_table :data_table2s
      drop_table :data_table3s
      drop_table :data_table4s
      
  end
end
