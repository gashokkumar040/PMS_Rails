class User < ApplicationRecord

  before_create :confirmation_token1

  # resources :users do
  #   member do
  #     get :confirm_email
  #   end
  # end

  #  enum role: [:user, :admin]
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :user
  # end


  #validates :login, :email, presence: true
 
  #before_validation :ensure_login_has_a_value

  


  def will_save_change_to_email?
    true
  end

  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 
  #validates :username,uniqueness: true

  def send_welcome_email
    @user = first_name
    UserMailer.welcome_email(first_name).deliver_now
  end

  has_many :projects


  #private
    # def ensure_login_has_a_value
    #   if login.nil?
    #     self.login = email unless email.blank?
    #   end
    # end
after_save :save_changes

  def save_changes
    #self.table_name = 'servicename_user'
    #@email = email
    @email = email
    puts "====="
    puts "#{first_name}"
    puts "#{email}"
    puts "#{password}"
    puts "====="
    puts "#{username}"
    puts "====="
    #@greeting = 'Hi ashok'
    #  puts "#{@user.id}"
     #@user.changes
     #changed.inject({}) { |h, attr| h[attr] = attribute_change(attr); h }

    UserMailer.signup_confirmation.deliver_now
  end
  
  # def before_save
  #   @was_a_new_record = new_record?
  #   return true
  # end

  # def after_save
  #    if @was_a_new_record
  #      return @object.instance_variable_get(:@new_record_after_save)
  #    end
  # end
  


  # after_update :send_email
  # protected

  # def send_email
  #   if column_name_changed? && !email_sent?
  #     # Send email here
  #     update_attribute :email_sent, true
  #   end
  # end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  private
    def confirmation_token1
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end


  
=begin  def confirmation_required?
    false
    #true
  end
  def email_required?
    false
  end
=end

  # use this instead of email_changed? for rails >= 5.1
  
end

