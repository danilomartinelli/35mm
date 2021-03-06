# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  route :login do
    create as: "login"
  end

  get "check-inbox" => "login#check_inbox", as: :check_inbox

  get "verify-email" => "login#verify_email", as: :verify_email
end
