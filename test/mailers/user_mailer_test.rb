require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "welcome_email" do
    mail = UserMailer.welcome_email
    assert_equal "Ashok added Welcome email", mail.subject
    assert_equal ["@resource.email"], mail.to
    assert_equal ["ashokkumar.sykamcs@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end


# <%= @resource.email %>!

ashok kumar
ashokkumar.sykamcs@gmail.com
Privacy
My Account