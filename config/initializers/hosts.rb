# frozen_string_literal: true

Rails.env.on(:development) do
  config.hosts << /[a-z0-9-]+\.danilomartinelli\.xyz/
end
