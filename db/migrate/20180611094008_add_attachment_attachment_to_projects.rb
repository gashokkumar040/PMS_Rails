class AddAttachmentAttachmentToProjects < ActiveRecord::Migration[5.2]
  def self.up
    change_table :projects do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :projects, :attachment
  end
end
