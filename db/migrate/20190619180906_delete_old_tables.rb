class DeleteOldTables < ActiveRecord::Migration[5.2]
  def change
      drop_table :samples
      drop_table :parent1s
      drop_table :parent2s
  end
end
