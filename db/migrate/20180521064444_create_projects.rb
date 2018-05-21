class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :project_id
      t.string :project_title
      t.text :project_description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
