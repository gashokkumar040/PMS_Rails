class AddCreditsToUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :credits, :integer
  end

  def self.down
    remove_column :users, :credits, :integer
  end
end
