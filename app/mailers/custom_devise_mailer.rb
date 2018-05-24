class CustomDeviseMailer < Devise::Mailer

  helper :application # gives access to all helpers defined within `application_helper`.
  include User::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'user/mailer' # to make sure that your mailer uses the devise views

  # Overrides same inside Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  # Overrides same inside Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  # Overrides same inside Devise::Mailer
  def unlock_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  def update_data_instructions(record, token, opts={})
    set_organization_of record
    super
  end

  private
  ##
  # Sets organization of the user if available
  def set_organization_of(user)
    @organization = user.organization rescue nil
  end

  # def confirmation_instructions(record, token, opts={})
  #     opts[:subject] = "Email Confirmation"
  #     opts[:from] = 'ashokkumar.sykamcs@gmail.com'
  #     @data = opts[:custom_field]
  #   super
  # end
end