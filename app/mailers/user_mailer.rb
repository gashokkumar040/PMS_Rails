class UserMailer < ApplicationMailer

  def welcome_email(user)
     @user = user

     mail(to: @user.email, subject: "Welcome")
  end
  # =============
  # after_action :set_delivery_options,
  #              :prevent_delivery_to_guests,
  #              :set_business_headers
 
  # def feedback_message(business, user)
  #   @business = business
  #   @user = user
  #   mail
  # end
 
  # def campaign_message(business, user)
  #   @business = business
  #   @user = user
  # end
 
  # private
 
  #   def set_delivery_options
  #     # You have access to the mail instance,
  #     # @business and @user instance variables here
  #     if @business && @business.has_smtp_settings?
  #       mail.delivery_method.settings.merge!(@business.smtp_settings)
  #     end
  #   end
 
  #   def prevent_delivery_to_guests
  #     if @user && @user.guest?
  #       mail.perform_deliveries = false
  #     end
  #   end
 
  #   def set_business_headers
  #     if @business
  #       headers["X-SMTPAPI-CATEGORY"] = @business.code
  #     end
  #   end
  #   ==============

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  

=begin
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
=end
end


=begin
class UsersMailer < BaseMailer
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

