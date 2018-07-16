class AddWalletToTransactionHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :transaction_histories, :wallet, foreign_key: true
  end
end
