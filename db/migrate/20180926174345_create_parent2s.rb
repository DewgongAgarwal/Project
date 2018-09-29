class CreateParent2s < ActiveRecord::Migration[5.2]
  def change
    create_table :parent2s do |t|
      t.string :name

      t.timestamps
    end
  end
end
