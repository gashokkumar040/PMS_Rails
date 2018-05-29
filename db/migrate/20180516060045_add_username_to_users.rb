class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true

    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :phonenum, :string
  end
end
