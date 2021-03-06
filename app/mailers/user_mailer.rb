class UserMailer < ApplicationMailer

  default from: 'ashokkumar.sykamcs@gmail.com'

  def profile_update(changes,user)
    @user = user
    @changes=changes
    mail(:to => @user.email, :subject => "You updated your profile")
  end

 def after_confirmation(changes, user)
    @user = user
    @changes = changes
    mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Your Confirmed your mail...")
 end

 # def welcome_email(user)
 #   @user = user
 #   mail(:to @user.email), :subject=> 'Sample mail')
 # end

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
 end

end