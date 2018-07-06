class AddDebitsToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :credits, :integer,default: 0
  end

  def down
    remove_column :users, :credits, :integer
  end
end
