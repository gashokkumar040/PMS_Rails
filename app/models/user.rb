class User < ApplicationRecord
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

end

