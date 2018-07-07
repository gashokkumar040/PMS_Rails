class AddApprovedToProjects < ActiveRecord::Migration[5.2]
  def self.up
    add_column :projects, :approved, :boolean, :default => false
    add_column :projects, :approved_at, :datetime#, default: -> { 'CURRENT_TIMESTAMP' }
  end

  def self.down
    remove_column :projects, :approved, :boolean
    remove_column :projects, :approved_at, :datetime
  end
end
