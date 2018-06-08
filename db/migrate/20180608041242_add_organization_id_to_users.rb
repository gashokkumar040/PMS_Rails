class AddOrganizationIdToUsers < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :organization, foreign_key: true
    #add_column :users, :organization_id, :integer
  end
  def down
    remove_columns :users, [:organization_id]
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
