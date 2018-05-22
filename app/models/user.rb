class User < ApplicationRecord


  after_update :save_changes

protected
  def save_changes

    #@user.update(column:value) 
    #UserMailer.saved_data_email(@user).deliver_later

    #  def update_column(name, value)
    #   update_columns(name => value)
    # end
    #UserMailer.welcome_email(@user.name).deliver_now
  end

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
  
  


  
=begin  def confirmation_required?
    false
    #true
  end
  def email_required?
    false
  end
=end

  # use this instead of email_changed? for rails >= 5.1
  def will_save_change_to_email?
    false
  end

  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,uniqueness: true 
  #validates :username,uniqueness: true

  def send_welcome_email
    UserMailer.welcome_email(@user.name).deliver_now
  end

  has_many :projects
end

