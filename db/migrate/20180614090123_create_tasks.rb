class CreateTasks < ActiveRecord::Migration[5.2]
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.string :subject
      t.date :due_date
      t.string :status
      t.string :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    remove_table :tasks do |t|
      t.string :name
      t.string :subject
      t.date :due_date
      t.string :status
      t.string :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
