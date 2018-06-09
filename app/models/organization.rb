class Organization < ApplicationRecord
  belongs_to :admin
  has_many :users 
  has_many :projects
end
