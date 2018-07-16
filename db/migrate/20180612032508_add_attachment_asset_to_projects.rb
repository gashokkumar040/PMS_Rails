class AddAttachmentAssetToProjects < ActiveRecord::Migration[5.2]
  def self.up
    change_table :projects do |t|
      t.attachment :asset
    end
  end

  def down
    remove_attachment :projects, :asset
  end
end

