class Project < ApplicationRecord

  belongs_to :user
  has_many :tasks
  has_many :assets
  #has_many :attachments
  # attr_accessor :task_fields
  # @tasks = Task.new

  validate :project_title,:project_description,:user_id
  validates :asset, attachment_presence: true
  
  validates_with AttachmentPresenceValidator, attributes: :asset
  validates_with AttachmentSizeValidator, attributes: :asset, less_than: 11.megabytes

  has_attached_file :asset, styles: { medium: "300x300", :small  => "150x150>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, content_type: [
  'image/jpeg', 
  'image/png', 
  'image/gif', 
  'application/pdf',
  "application/doc", 
  "application/docx", 
  'application/txt'
  ]

end

