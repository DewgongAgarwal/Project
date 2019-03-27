class RemoveUserPasswordColumns < ActiveRecord::Migration[5.2]
    def change
        
        remove_column :students, :password_digest
        remove_column :teachers, :password_digest
        remove_column :schools, :password_digest
        
        
    end
end
