# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1920, 1080]

  setup do
    Capybara.server_port = ActionMailer::Base.default_url_options[:port]
  end
end
