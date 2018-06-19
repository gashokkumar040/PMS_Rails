class CreateCreditCheckers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :credit_checkers do |t|
      t.integer :count
      t.text :history
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :credit_checkers do |t|
      t.integer :count
      t.text :history
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

end
