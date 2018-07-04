class User < ApplicationRecord
  # # for rails_admin_charts to this model
  # # ====================
  # include RailsAdminCharts

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
  #has_many :organizations through: :admin
  
  devise :google_authenticatable, :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 

  # before_create :confirmation_token

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
  
  #=========
  #for Confirmed accounts
  # def password_match?
  #    self.errors[:password] << I18n.t('errors.messages.blank') if password.blank?
  #    self.errors[:password_confirmation] << I18n.t('errors.messages.blank') if password_confirmation.blank?
  #    self.errors[:password_confirmation] << I18n.translate("errors.messages.confirmation", attribute: "password") if password != password_confirmation
  #    password == password_confirmation && !password.blank?
  # end

  # new function to set the password without knowing the current 
  # password used in our confirmation controller. 
  # def attempt_set_password(params)
  #   p = {}
  #   p[:password] = params[:password]
  #   p[:password_confirmation] = params[:password_confirmation]
  #   update_attributes(p)
  # end

  # new function to return whether a password has been set
  # def has_no_password?
  #   self.encrypted_password.blank?
  # end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # Instead you should use `pending_any_confirmation`.  
  # def only_if_unconfirmed
  #   pending_any_confirmation {yield}
  # end
  #=========

  # private
  #   def confirmation_token
  #     if self.confirm_token.blank?
  #         self.confirm_token = SecureRandom.urlsafe_base64.to_s
  #     end
  #   end 

  #   def email_activate
  #     self.email_confirmed = true
  #     self.confirm_token = nil
  #     save!(:validate => false)
  #   end


  protected

  def serializable_hash(options = nil) 
    super(options).merge(encrypted_password: encrypted_password, reset_password_token: reset_password_token, confirmation_token:confirmation_token,confirmed_at:confirmed_at,confirmation_sent_at:confirmation_sent_at) # you can keep adding attributes here that you wish to expose
  end
 
end