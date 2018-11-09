class AddKeysToSchool < ActiveRecord::Migration[5.2]
  def change
    add_column :Schools, :keys, :text
  end
end
