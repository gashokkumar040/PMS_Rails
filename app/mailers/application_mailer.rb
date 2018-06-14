class ApplicationMailer < ActionMailer::Base
  # default from: 'gashokkumar040@gmail.com'
  # layout 'mailer'


  # def sample_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Sample Email')
  # end
  # def welcome(recipient)
  #   attachments['free_book.pdf'] = File.read('path/to/file.pdf')
  #   mail(:to => recipient, :subject => "New account information")
  # end

  def welcome(recipient)
    attachments['filename.jpg'] = {:mime_type => 'application/mymimetype',
                                   :content => some_string }
    mail(:to => recipient, :subject => "New account information")
  end
  
end
