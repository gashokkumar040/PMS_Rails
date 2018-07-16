class CreateCreditCheckers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :credit_checkers do |t|
      t.integer :balance
      t.text :history
      t.integer :amount,        default: 0
      t.string :account_status, default: "" 
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
     drop_table :credit_checkers 
  end

end
