# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   #include Accessible
    #skip_before_action :check_user, only: :destroy
  before_action :authenticate_user!
#===================
  # before_action :configure_permitted_parameters

  # protected

  # # my custom fields are :name, :heard_how
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |u|
  #     u.permit(:first_name, :last_name,:username, :phonenum,:is_female,:date_of_birth,
  #           :email, :password, :password_confirmation)
  #   end
  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:first_name, :last_name,:username, :phonenum,:is_female,:date_of_birth,
  #       :email, :password, :password_confirmation, :current_password)
  #   end
  # end

  # private

  #   def sign_up_params
  #       params.require(:user).permit(:first_name, :last_name,:username, :phonenum,:is_female,:date_of_birth,
  #           :email, :password, :password_confirmation)
  #   end

  #   def account_update_params
  #   params.require(:user).permit(:first_name, :last_name,:username, :phonenum,:is_female,:date_of_birth,
  #           :email, :password, :password_confirmation, :current_password)
  #   end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
#=========================
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #  super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
