class AddColumnsToAllUsers < ActiveRecord::Migration[5.2]
  def change
      
      add_column :students, :token, :string
      add_column :students, :timestamp, :datetime
      
      add_column :teachers, :token, :string
      add_column :teachers, :timestamp, :datetime
      
      add_column :schools, :token, :string
      add_column :schools, :timestamp, :datetime
      
      
  end
end
