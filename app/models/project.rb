class Project < ApplicationRecord
  belongs_to :user
  #belongs_to :admin

  validate :project_title,:project_description,:user_id
end

