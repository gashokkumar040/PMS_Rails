class AddAccountInfoToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :account_info, :string
  end

  def self.down
    remove_column :users, :account_info, :string
  end
end
