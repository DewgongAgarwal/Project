class AddKeysToStudent < ActiveRecord::Migration[5.2]
  def change
      add_column :Students, :keys, :text
  end
end
