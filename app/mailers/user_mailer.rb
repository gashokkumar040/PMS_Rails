class UserMailer < ApplicationMailer

  default from: 'gashokkumar040@gmail.com'

  def signup_confirmation
    #@user = user

    #mail to: @user.email, 
    #mail subject: 'Sign up Confirmation 123!!!'
  end

  #default :from => "me@mydomain.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation 111")
 end

end
