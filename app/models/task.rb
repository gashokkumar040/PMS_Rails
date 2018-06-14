class Task < ApplicationRecord

  validates :name,        :presence => true
  validates :subject,     :presence => true
  validates :due_date,    :presence => true
  validates :status,      :presence => true
  validates :description, :presence => true
  validates :project_id,  :presence => true

  belongs_to :project

end
