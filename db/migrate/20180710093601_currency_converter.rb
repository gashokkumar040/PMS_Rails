class CurrencyConverter < ActiveRecord::Migration[5.2]
  def up
    create_table :currency_converters do |t|
      t.decimal :BTC_INR
      t.timestamps
    end
  end
  def down
    drop_table :currency_converters do |t|
      t.decimal :BTC_INR
      t.timestamps
    end
  end
end
