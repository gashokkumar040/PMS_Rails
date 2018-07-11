
class User < ApplicationRecord
 
  include RailsAdminCharts

  # def self.graph_data since=30.days.ago
  #   [
  #     {
  #         name: 'Admin Users',
  #         pointInterval: point_interval = 1.day * 1000,
  #         pointStart: start_point = since.to_i * 1000,
  #         data: self.where(type: 'Admin').delta_records_since(since)
  #     },
  #     {
  #         name: 'Standard Users',
  #         pointInterval: point_interval,
  #         pointStart: start_point,
  #         data: self.where(type: nil).delta_records_since(since)
  #     }
  #   ]
  # end
  
  def self.label_rotation
    # "-45"
  end
  # # =================
  #accepts_nested_attributes_for :credit_checker
  # BLACKLIST_FOR_SERIALIZATION =[:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :password_salt, :confirmation_token, :confirmed_at, :confirmation_sent_at, :remember_token, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at]
  # if you want to de_serialize use serializable_hash(options = nil) add blacklists for this method by calling marge super(options).merge(encrypted_password: encrypted_password,....) 
	
  #If all you want to do it list all the attributes in the Rails console, it is easier to use 
  #User.first.serializable_hash(force_except: true)
  
  attr_accessor :gauth_token
  attr_accessor :project_fields
  attr_accessor :credit_checkers_fields
  
  has_many :credit_checkers, dependent: :destroy
  has_many :projects
  has_many :tasks
  has_many :assets
  belongs_to :organization
  has_many :transaction_histories
  has_many :wallets
  
  devise :google_authenticatable, :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 

  scope :with_pending_projects, -> { joins(:projects).where('projects.approved = false') }

  after_create :after_confirmation_path_for 
  before_save :save_changes
  
 
  # Mail to user with Updated data
  def save_changes
    @hash = Hash.new { |hash, key| hash[key] = [] }
    self.changes.each{ |k,v| @hash[k] << v }
    unless email_confirmed?
      if self.changes.count == 0 && self.changes.keys != [:first_name, :last_name, :date_of_birth,:username]
        puts "No updates"
      else 
        #UserMailer.profile_update(@hash.slice("first_name","last_name","date_of_birth","username"),self).deliver_now   
      end    
    end
  end
  #end Updated Changes mail

  def after_confirmation_path_for
    if self.email_confirmed = true 
      #UserMailer.after_confirmation(changes.keys, self).deliver_now
    else  
      puts "nothing"
    end
  end
  
  protected

  def serializable_hash(options = nil) 
    super(options).merge(encrypted_password: encrypted_password, reset_password_token: reset_password_token, confirmation_token:confirmation_token,confirmed_at:confirmed_at,confirmation_sent_at:confirmation_sent_at) # you can keep adding attributes here that you wish to expose
  end
 
end