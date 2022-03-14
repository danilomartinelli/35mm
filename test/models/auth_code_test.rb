# frozen_string_literal: true

require "test_helper"

class AuthCodeTest < ActiveSupport::TestCase
  test "creates a valid login url" do
    login_url = LoginLink.create("me@danilomartinelli.xyz")

    assert LoginLink.valid?(login_url)
  end

  test "rejects expired url" do
    login_url = LoginLink.create("me@danilomartinelli.xyz")

    AuthCode.last.update(expires_at: 10.minutes.ago)

    refute LoginLink.valid?(login_url)
  end
end
