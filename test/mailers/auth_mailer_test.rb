# frozen_string_literal: true

require "test_helper"

class AuthMailerTest < ActionMailer::TestCase
  test "login" do
    login_link = LoginLink.create!("john@35mm.com")

    encrypted_email = Encryptor.encrypt("john@35mm.com", purpose: :login)
    encrypted_login_link = Encryptor.encrypt(login_link, purpose: :login)

    mail = AuthMailer.login(encrypted_email, encrypted_login_link)

    assert_equal "Login", mail.subject
    assert_equal ["john@35mm.com"], mail.to
    assert_equal ["hi@example.com"], mail.from
  end
end
