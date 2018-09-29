class RenameColumn < ActiveRecord::Migration[5.2]
    def self.up
    rename_column :posts, :type, :types1
end

def self.down
    rename_column :posts, :types1, :type
end
end
