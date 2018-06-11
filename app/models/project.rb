class Project < ApplicationRecord

  belongs_to :user
  has_many :tasks

  validate :project_title,:project_description,:user_id
  validates :attachment, attachment_presence: true
  
  # validates_with AttachmentPresenceValidator, attributes: :attachment
  # validates_with AttachmentSizeValidator, attributes: :attachment, less_than: 10.megabytes

  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: [
  'image/jpeg', 
  'image/png', 
  'image/gif', 
  'application/pdf',
  "application/doc", 
  "application/docx", 
  'application/txt'
  ]

end

