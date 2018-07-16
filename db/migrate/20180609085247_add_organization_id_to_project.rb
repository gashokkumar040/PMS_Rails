class AddOrganizationIdToProject < ActiveRecord::Migration[5.2]
  
  def self.up
    add_reference :projects, :organization, foreign_key: true
  end

  def down
    remove_columns :projects, [:organization_id]
  end
end
