# frozen_string_literal: true

require "test_helper"

class AuthCodeTest < ActiveSupport::TestCase
  test "creates a valid login url" do
    login_url = LoginLink.create!("me@danilomartinelli.xyz")

    assert LoginLink.valid?(login_url)
  end

  test "rejects expired url" do
    login_url = LoginLink.create!("me@danilomartinelli.xyz")

    params = Rack::Utils.parse_query URI(login_url).query

    auth_code = AuthCode.find_by(code: params["code"])

    auth_code.update(expires_at: 10.minutes.ago)

    assert_not LoginLink.valid?(login_url)
  end

  test "detects expired code" do
    expires_at = 1.second.ago
    assert AuthCode.new(expires_at:).expired?
  end

  test "detects fresh code" do
    expires_at = 1.minute.from_now
    assert_not AuthCode.new(expires_at:).expired?
  end
end
