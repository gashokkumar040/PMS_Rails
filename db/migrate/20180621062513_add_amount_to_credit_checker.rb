class AddAmountToCreditChecker < ActiveRecord::Migration[5.2]
  def self.up
    add_column :credit_checkers, :amount, :integer
    
  end
  def self.down
    remove_column :credit_checkers, :amount, :integer
  end

end
