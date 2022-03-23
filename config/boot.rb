# frozen_string_literal: true

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

require "active_support"
require "active_support/core_ext/numeric/time"

# Load configuration.
require "env_vars/dotenv"
require File.expand_path("config", __dir__)
