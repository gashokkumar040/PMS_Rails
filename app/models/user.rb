class User < ApplicationRecord

  # after_create :confirmation_token1
  after_create :after_confirmation_path_for 

  before_save :save_changes 


  def changed_data
    for i in self.changes
        
    end
  end


  def save_changes
    @n = self.changes.count

    puts "Changes Count is : #{@n}"

    @hash = Hash.new { |hash, key| hash[key] = [] }

    self.changes.each{ |k,v| @hash[k] << v }
    if self.changes.count == 0
      puts "No updates"
    elsif self.changes.keys == "first_name" || "last_name" || "date_of_birth" || "username" 
      UserMailer.profile_update(@hash.slice("first_name","last_name","date_of_birth","username"),self).deliver_now   
    else
      puts "nothing"
    end
    
    puts "====="
    puts "hash data is #{@hash.slice("first_name","last_name","date_of_birth","username")}"
    puts "====="

  end

  def after_confirmation_path_for
    if self.confirmation_token =true
      UserMailer.after_confirmation(changes.keys, self).deliver_now
    else
      
      puts "nothing"
    end
  end

  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 
  #validates :username,uniqueness: true

  # def send_welcome_email
  #   @user = first_name
  #   UserMailer.welcome_email(first_name).deliver_now
  # end

  has_many :projects


  #private
    # def ensure_login_has_a_value
    #   if login.nil?
    #     self.login = email unless email.blank?
    #   end
    # end
  
  
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
    # def confirmation_token1
    #   if self.confirm_token.blank?
    #       self.confirm_token = SecureRandom.urlsafe_base64.to_s
    #   end
    # end

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

