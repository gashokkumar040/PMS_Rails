class AddUserRefToTasks < ActiveRecord::Migration[5.2]
  def up
    add_reference :tasks, :user, foreign_key: true
  end

  def down
    remove_column :tasks, :user_id
  end
end
