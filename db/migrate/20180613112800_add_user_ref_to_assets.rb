class AddUserRefToAssets < ActiveRecord::Migration[5.2]
  def self.up
    add_reference :assets, :user, foreign_key: true
  end

  def self.down
    remove_reference(:assets, :user,{:foreign_key=>true})
  end
end
