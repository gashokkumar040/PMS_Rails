class AddApprovedToProjects < ActiveRecord::Migration[5.2]
  def self.up
    add_column :projects, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :approved, :boolean
  end
end
