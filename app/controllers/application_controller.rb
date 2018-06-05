class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception 
    protect_from_forgery prepend: true
    prepend_before_action :authenticate_user!
    #prepend_before_action :check_gauth
  
    prepend_before_action :configure_permitted_parameters, if: :devise_controller?

    add_flash_types :danger, :info, :success, :warning, :notice

    # def current_user
    #   @current_user ||= User.where(id: session[:id]).first
    # end
    # helper_method :current_user

    protected

    def configure_permitted_parameters
      #for device two factor authenicator
      #devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
      #devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :is_female, :date_of_birth, :email, :password,:phonenum, :password_confirmation) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :is_female, :date_of_birth,:username,:password_confirmation) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    end

    def check_gauth
      if self.resource.class == User
        user_checkga_path
      end
    end

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

