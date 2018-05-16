# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    ExampleMailer.sample_email(User.name)
  end
end