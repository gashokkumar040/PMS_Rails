class SessionsController < ApplicationController

  def create
      user = User.find_by_email(params[:email].downcase)
      if user && user.authenticate(params[:password])

        if user.email_confirmed
            session[:user_id] = user.id
            redirect_to root_url, notice: "Logged in!"      
        else
          flash[:error] = 'Please Confirm your account.'
          
        end
      else
        redirect_to root_url, flash: 'Email or Password was wrong.'
      end
  end

  def destroy
    session.delete[:user_id]
    redirect_to root_url, notice: "Successfully Logged out, destroying session ID..."
  end


end