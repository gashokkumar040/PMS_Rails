class AddEmailConfirmColumnToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :email_confirmed, :boolean, :default => false
    add_column :users, :confirm_token, :string
  end

  def down
    remove_column :users, :email_confirmed, :boolean, :default => false
    remove_column :users, :confirm_token, :string
  end
end
