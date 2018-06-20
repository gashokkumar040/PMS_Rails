class AddCreditsToUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :credits, :integer, :default => 0 
    add_column :users, :credit_history, :string 
  end

  def self.down
    remove_column :users, :credits, :integer
    remove_column :users, :credit_history, :string
  end
end
