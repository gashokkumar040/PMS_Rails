class ApplicationController < ActionController::Base


    #include Error::ErrorHandler
    protect_from_forgery prepend: true
    prepend_before_action :authenticate_user!
    
    #prepend_before_action :check_gauth
  
    prepend_before_action :configure_permitted_parameters, if: :devise_controller?

    add_flash_types :danger, :info, :success, :warning, :notice

    prepend_before_action :reload_rails_admin, if: :rails_admin_path?

    # def current_user
    #   @current_user ||= User.where(id: session[:id]).first
    # end
    # helper_method :current_user

    protected

    def configure_permitted_parameters
      #for device two factor authenicator
      #devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
      #devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :is_female, :date_of_birth, :email, :password,:phonenum, :password_confirmation,:organization_id) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password,:phonenum, :current_password, :is_female, :date_of_birth,:username,:password_confirmation) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    end

    def check_gauth(resource)
      if resource.class == User
        user_checkga_path
      end
    end

    def after_sign_in_path_for(resource)
      if resource.class == Admin#istrator
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :is_female, :date_of_birth, :email, :password,:phonenum, :password_confirmation,:organization_id,:approved) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password,:phonenum, :current_password, :is_female, :date_of_birth,:username,:password_confirmation,:approved) }
        rails_admin_path
      elsif resource.class == User
        users_path
      else
        # Change profile_path to where you want regular users to go
        stored_location_for(resource) || root_path
      end
    end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end

    protect_from_forgery with: :exception 

    # ================== added for auto reload rails_config
    private

    def reload_rails_admin
      models = %W(User UserProfile)
      models.each do |m|
        RailsAdmin::Config.reset_model(m)
      end
      RailsAdmin::Config::Actions.reset

      load("#{Rails.root}/config/initializers/rails_admin.rb")
    end

    def rails_admin_path?
      controller_path =~ /rails_admin/ && Rails.env.development?
    end
    # ====================
end

