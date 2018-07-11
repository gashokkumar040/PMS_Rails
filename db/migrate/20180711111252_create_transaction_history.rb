class CreateTransactionHistory < ActiveRecord::Migration[5.2]
  def up
    create_table :transaction_histories do |t|
      t.string :currency_type 
      t.decimal :btc_amount,default: 0.0
      t.decimal :inr_balance,default: 0.0
      t.decimal :btc_balance,default: 0.0
      t.string :inr_status
      t.string :btc_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :transaction_histories
  end
end
