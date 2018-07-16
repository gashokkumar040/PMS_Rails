class CreateCurrencies < ActiveRecord::Migration[5.2]
   def self.up
    create_table :currencies do |t|
      t.decimal :btc_inr
      t.timestamps
    end
  end
  def down
    drop_table :currencies 
  end
end


