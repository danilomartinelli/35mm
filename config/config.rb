# frozen_string_literal: true

module ThirtyFiveMm
  Config = Env::Vars.new do
    mandatory :database_url, string
    mandatory :tz, string

    credential :encryptor_secret
    credential :signed_url_secret

    optional :app_host, string, "dev.danilomartinelli.xyz"
  end
end
