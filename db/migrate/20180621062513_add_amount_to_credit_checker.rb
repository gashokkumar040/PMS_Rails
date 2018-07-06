class AddAmountToCreditChecker < ActiveRecord::Migration[5.2]

  def self.up
    add_column :credit_checkers, :amount, :integer,default: 0
    add_column :credit_checkers, :account_status, :string, default: "" 
  end

  def self.down
    remove_column :credit_checkers, :amount, :integer
    remove_column :credit_checkers, :account_status, :string, default: "" 
  end

end
