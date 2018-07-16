class CreateProjects < ActiveRecord::Migration[5.2]
  def self.up
    create_table :projects do |t|

      t.string :project_title
      t.text :project_description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :projects do |t|

      t.string :project_title
      t.text :project_description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
