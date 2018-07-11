class CreateWallet < ActiveRecord::Migration[5.2]
  def up
    create_table :wallets do |t|
      t.decimal :inr_balance,default: 0.0
      t.decimal :btc_balance,default: 0.0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :wallets
  end
end
