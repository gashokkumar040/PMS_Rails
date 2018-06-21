class AddAccountInfoToUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :credit_info, :string
    add_column :users, :debit_info, :string
  end

  def self.down
    remove_column :users, :credit_info, :string
    remove_column :users, :debit_info, :string
  end
end
