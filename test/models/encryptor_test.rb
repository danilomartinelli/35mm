require "test_helper"

class EncryptorTest < ActiveSupport::TestCase
  test "encrypts message" do
    encrypted = Encryptor.encrypt("hello")
    assert_not_equal "hello", encrypted
  end

  test "decrypts message" do
    decrypted = Encryptor.decrypt(Encryptor.encrypt("hello"))
    assert_equal "hello", decrypted
  end

  test "returns nil for invalid decryption" do
    assert_nil Encryptor.decrypt("foo")
  end
end
