class AuthMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.auth_mailer.verify_email.subject
  #
  def verify_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end