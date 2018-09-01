class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.integer :school

      t.timestamps
    end
  end
end
