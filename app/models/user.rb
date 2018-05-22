class User < ApplicationRecord


  # after_save :save_changes


  # def save_changes

  #   UserMailer.welcome_email(@user.name).deliver_now
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  protected


  
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

