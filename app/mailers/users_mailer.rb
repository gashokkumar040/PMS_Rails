=beginclass UsersMailer < BaseMailer
def welcome_email(user_id)
    @user = User.find(user_id)

    mail(   :to      => @user.email,
            :from    => "ourcompany@site.com",
            :subject => "Welcome"
    ) do |format|
      format.text
      format.html
    end
  end
end
=end