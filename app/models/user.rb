class User < ApplicationRecord
	attr_accessor :gauth_token

  # after_create :confirmation_token1
  after_create :after_confirmation_path_for 

  before_save :save_changes 


  def save_changes
    @n = self.changes.count

    puts "Changes Count is : #{@n}"

    @hash = Hash.new { |hash, key| hash[key] = [] }

    self.changes.each{ |k,v| @hash[k] << v }
    if self.changes.count == 0
      puts "No updates"
    elsif self.changes.keys == "first_name" || "last_name" || "date_of_birth" || "username" 
      #UserMailer.profile_update(@hash.slice("first_name","last_name","date_of_birth","username"),self).deliver_now   
    else
      puts "nothing"
    end
    
    puts "====="
    puts "hash data is #{@hash.slice("first_name","last_name","date_of_birth","username")}"
    puts "====="

  end

  def after_confirmation_path_for
    if self.email_confirmed = true #user_signed_in?
      #UserMailer.after_confirmation(changes.keys, self).deliver_now
    else  
      puts "nothing"
    end
  end

  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 

  has_many :projects

 
  
  private

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  #=========
  #for Confirmed accounts
  def password_match?
     self.errors[:password] << I18n.t('errors.messages.blank') if password.blank?
     self.errors[:password_confirmation] << I18n.t('errors.messages.blank') if password_confirmation.blank?
     self.errors[:password_confirmation] << I18n.translate("errors.messages.confirmation", attribute: "password") if password != password_confirmation
     password == password_confirmation && !password.blank?
  end

  # new function to set the password without knowing the current 
  # password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # Instead you should use `pending_any_confirmation`.  
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  #=========
  

  
end

