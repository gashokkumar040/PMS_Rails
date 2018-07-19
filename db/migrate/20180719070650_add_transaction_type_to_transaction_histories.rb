class AddTransactionTypeToTransactionHistories < ActiveRecord::Migration[5.2]
  def up
    add_column :transaction_histories, :transaction_type,    :string
    add_column :transaction_histories, :btc_per_transaction, :decimal
  end
  def down
    remove_column :transaction_histories, :transaction_type,    :string
    remove_column :transaction_histories, :btc_per_transaction, :decimal
  end
end
