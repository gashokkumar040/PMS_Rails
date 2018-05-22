class CreatePosts < ActiveRecord::Migration[5.2]
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end

