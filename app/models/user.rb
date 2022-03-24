# frozen_string_literal: true

class User < ApplicationRecord
  encrypts :email, deterministic: true, downcase: true

  defaults username: lambda {
                       Haiku.next do |new_username|
                         User.exists?(username: new_username)
                       end
                     }
end
