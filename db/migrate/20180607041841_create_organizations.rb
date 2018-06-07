class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.belongs_to :admin, foreign_key: true

      t.timestamps
    end
  end
end
