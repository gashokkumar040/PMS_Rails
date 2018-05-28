class Project < ApplicationRecord
  belongs_to :user

  validate :project_title,:project_description,:user_id
end
