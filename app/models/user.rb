class User < ApplicationRecord
  attr_keyring ENV["USER_KEYRING"], digest_salt: "<custom_salt>"

  attr_encrypt :email
end
