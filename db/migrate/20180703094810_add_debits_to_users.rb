class AddDebitsToUsers < ActiveRecord::Migration[5.2]
  def up
    # add_column :users, :debits, :integer,default: 0
    add_column :users, :credits, :integer,default: 0
  end

  def down
    # remove_column :users, :debits, :integer
    remove_column :users, :credits, :integer
  end
end
