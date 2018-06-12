class CreateAssets < ActiveRecord::Migration[5.2]
  def self.up
    create_table :assets do |t|
      t.belongs_to :project, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
