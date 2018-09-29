class CreateTTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :t_types do |t|

      t.timestamps
    end
  end
end
