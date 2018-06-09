class Project < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :tasks
  #belongs_to :admin

  validate :project_title,:project_description,:user_id
  has_attached_file :attachment
end

