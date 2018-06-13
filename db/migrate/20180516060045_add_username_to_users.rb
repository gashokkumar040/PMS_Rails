class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :username, :string
    add_index :users, :username, unique: true

    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :phonenum, :string
  end

  def self.down
    remove_column :users, :username, :string
    remove_index :users, :username, unique: true

    remove_column :users, :last_name, :string
    remove_column :users, :date_of_birth, :date
    remove_column :users, :is_female, :boolean, default: false
    remove_column :users, :phonenum, :string
  end
end
