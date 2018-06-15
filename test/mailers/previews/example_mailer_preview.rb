# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
    ExampleMailer.welcome_email(User.first)
  end
end