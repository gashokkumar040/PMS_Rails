class ApplicationMailer < ActionMailer::Base
  #default from: 'gashokkumar040@gmail.com'
  layout 'mailer'

=begin
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
=end
end
