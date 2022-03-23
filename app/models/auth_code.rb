# frozen_string_literal: true

class AuthCode < ApplicationRecord
  encrypts :code, deterministic: true

  defaults code: lambda {
    Haiku.call(variant: lambda {
      SecureRandom.hex(5)
    })
  }, expires_at: lambda {
                   ThirtyFiveMm::Config.email_verification_ttl.minutes.from_now
                 }

  def expired?
    Time.now.to_i > expires_at.to_i
  end
end
