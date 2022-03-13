# frozen_string_literal: true

module ThirtyFiveMm
  Config = Env::Vars.new do
    mandatory :database_url, string
    mandatory :tz, string

    credential :encryption_key
  end
end
