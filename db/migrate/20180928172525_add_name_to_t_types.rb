class AddNameToTTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :t_types, :name, :string
  end
end
