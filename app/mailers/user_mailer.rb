class UserMailer < ApplicationMailer

  default from: 'no-reply@test.lindsaar.net'

  def signup_confirmation(user)
    @user = user

    mail to: @user.email, subject: 'Sign up Confirmation'
  end
end
