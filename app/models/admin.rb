class Admin < ApplicationRecord
  
  has_many :organizations
  #self.table_name = "admins" 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable, 
         :recoverable, :rememberable, :trackable, :validatable


    def current_user
      @current_user ||= User.where(id: session[:id]).first
    end

    #helper_method :current_user


    def after_sign_in_path_for(resource)
      if resource.class == Admin#istrator
        rails_admin_path
      elsif resource.class == User
        users_path
      else
        # Change profile_path to where you want regular users to go
        stored_location_for(resource) || root_path
      end
    end
  
end
