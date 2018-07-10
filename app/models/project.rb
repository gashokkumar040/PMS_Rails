class Project < ApplicationRecord
  belongs_to :user
  has_many :credit_checkers, dependent: :destroy
  has_many :tasks #, dependent: :destroy
  has_many :assets 
  
  include RailsAdminCharts

  attr_accessor :credit_checker_fields, :user_fields
  attr_accessor :task_fields, :asset_fields, :project_fields

  validates :project_title,:presence => true, :length => { :minimum => 5 }
  validates :project_description, :presence => true, :length => { :minimum => 15 }
  validate :approved
  
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


  #before_save :validate_approval#, if: :approved_changed?  #only: [:approved] 
  before_save :validate_approval, on: :update, if: :approved_changed?
  
  def validate_approval
    if self.approved == true
      puts "@@@@@@"
      puts "calling 1......"
      user.credits += 1
      user.save
      CreditChecker.create(amount: 1,  balance: user.credits, user_id: user.id, project_id: self.id,account_status: "credit")   
    else
      puts "@@@@@@"
      puts "calling 2......"
      user.credits -= 1
      user.save
      CreditChecker.create(amount: 1, balance: user.credits, user_id: user.id, project_id: self.id,account_status: "debit") 
    end
    @u = user.id
  end


  def self.graph_data since=30.days.ago
    [
      {
        name: 'Projects',
        pointInterval: 1.day * 1000,
        pointStart: since.to_i * 1000,
        data: self.where(approved: true, id:self.ids).delta_records_since(since)
      }
    ]
  end

#   def validate_approval
#     @hash = Hash.new{ |h,k| h[k]=[] }
#     self.changes.each{ |k,v| @hash[k] << v }

#     @u = User.find(user_id)
#     @p = Project.find(id)
    
#     puts "++++++++"
#     puts "::: #{approved_changed?}  :::"
#     puts ":::#{@hash}:::"
#     puts ":::#{self.changes}:::"
#     puts "@hash.has_key?('approved') ==== #{@hash.has_key?('approved')}"
#     #puts "@hash.fetch('approved') ======= #{@hash.fetch('approved')}"
#     puts "++++++++"

#     # =======

#     if  @hash.has_key?('approved')#self.changes.keys 
#         @u = User.find(user_id)
#         @p = Project.find(id)
#         puts "*****"
#         puts "@hash.fetch('approved')[0][1] ======= #{@hash.fetch('approved')[0][1]}"
#         puts "*****"
#       if @hash.fetch('approved')[0][1] == true    #self.approved == true
#         puts "====== user attributes ========"
#         puts "#{user.attributes}"
#         puts "============uattend============"
#         puts "you approved this project"

#         if user.credit_history.nil?
#           user.credit_history = "credits for these projects approved : " + self.id.to_s
#         else
#           user.credit_history = user.credit_history + " , " + self.id.to_s   
#         end
#         user.credits += 1
#         user.save
#       else
#         puts "  "
#         user.credits = user.credits-1 
#         user.credit_history = user.credit_history + " - " + self.id.to_s
#         user.save
#         puts "u ===== #{@u.credits}"
#         puts "you are not approved yet..."
#         puts "  "
#       end
#     else
#       puts 'do nothing'
#     end
#   end

 end

