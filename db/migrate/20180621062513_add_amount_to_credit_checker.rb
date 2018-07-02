class AddAmountToCreditChecker < ActiveRecord::Migration[5.2]
  def self.up
    add_column :credit_checkers, :amount, :integer
    add_column :credit_checkers, :credit_info, :string
    add_column :credit_checkers, :debit_info, :string 
  end
  def self.down
    remove_column :credit_checkers, :amount, :integer
    remove_column :credit_checkers, :credit_info, :string
    remove_column :credit_checkers, :debit_info, :string
  end

end
