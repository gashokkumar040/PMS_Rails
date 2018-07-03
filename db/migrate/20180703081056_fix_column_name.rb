class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :credit_checkers, :count, :balance
  end
end
