# frozen_string_literal: true

module ThirtyFiveMm
  Config = Env::Vars.new do
    mandatory :database_url, string
    mandatory :tz, string

    credential :encryptor_secret
    credential :signed_url_secret

    optional :app_host, string, "dev.danilomartinelli.xyz"
    optional :default_email_sender, string, "hi@example.com"
    optional :email_verification_ttl, int, 10.minutes
  end
end
