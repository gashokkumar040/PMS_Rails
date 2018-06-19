class Project < ApplicationRecord

  #observe :user
  attr_accessor :credit_checker_fields, :user_fields
  attr_accessor :task_fields, :asset_fields, :project_fields

  


  # @tasks = Task.new

  validates :project_title,:presence => true, :length => { :minimum => 5 }
  validates :project_description, :presence => true, :length => { :minimum => 15 }
  #validate :user_id
  validate :approved
  #validates :asset, attachment_presence: true
  
  validates_with AttachmentPresenceValidator, attributes: :asset
  validates_with AttachmentSizeValidator, attributes: :asset, less_than: 11.megabytes

  belongs_to :user
  has_one :credit_checker, dependent: :destroy
  has_many :tasks #, dependent: :destroy
  has_many :assets
  before_save :validate_approval

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


  def validate_approval
    #puts "#{project[:approved]}"
    self.user.credits.inspect
    @u = User.find(user_id)
     if self.approved == true

        puts "====== user attributes ========"
         puts "#{user.attributes}"

         puts "============uattend===="
         puts "#{@hash}"
         #u = user.attribute.find(:credits)
         #puts "u ===== #{u}"

         # user.each{ |k,v|

         # }
        # self.user.credits = 1
        #self.user.credits.commit
        puts "you approved this project"
        
        @u.credits += 1
        @u.save
        #puts "#{current_user.find[:credits]}"
      else
        puts "  "
        u = User.find(user_id)
        @u.credits = @u.credits-1
        @u.save
        #u.credits
        puts "u ===== #{u.credits}"
        puts "#{@hash}"
        puts "you are not approved yet..."
        puts "  "
     end
  end



end

