# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   include Accessible
    skip_before_action :check_user, only: :destroy

    prepend_before_action :authenticate_user!
    prepend_before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  # def new
  #   super
  # end

  # # POST /resource/sign_in
  # def create
  #   super
  # end

  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password,:remember_me])
  end


  def create
      user = User.find_by_email(params[:email].downcase)
      if user && user.authenticate(params[:password])
        
      if user.email_confirmed
          sign_in user
        redirect_back_or user
      else
        flash.now[:error] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
  end
 

  #  def destroy
  #   session.delete
  #   redirect_to root_url, notice: "Successfully Logged out, destroying session ID..."
  # end

end

