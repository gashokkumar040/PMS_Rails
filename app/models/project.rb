class Project < ApplicationRecord


  
  attr_accessor :task_fields, :asset_fields
  # @tasks = Task.new

  validates :project_title,:presence => true, :length => { :minimum => 5 }
  validates :project_description, :presence => true, :length => { :minimum => 15 }
  validate :user_id
  #validates :asset, attachment_presence: true
  
  validates_with AttachmentPresenceValidator, attributes: :asset
  validates_with AttachmentSizeValidator, attributes: :asset, less_than: 11.megabytes

  belongs_to :user
  has_many :tasks #, dependent: :destroy
  has_many :assets


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

