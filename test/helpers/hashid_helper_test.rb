require 'test_helper'
class HashidHelperTest < ActionView::TestCase
  HASH_LENGTH = 8

  SALT = "This is my test salt."
  SOURCE_ID = 8342952
  HASH_ID = "rGQRd7Y6"

  setup do
    hash_initialize SALT, HASH_LENGTH
  end

  test "should encode an integer into a hash." do
    encoded_hash = hash_encode SOURCE_ID
 
    assert_equal HASH_ID, encoded_hash
  end

  test "should decode a hash back to the same integer. - Test Case 1" do
    decoded_integer = hash_decode HASH_ID
 
    assert_equal SOURCE_ID, decoded_integer
  end

  test "should decode a hash back to the same integer. - Test Case 2 - Reversal" do
    encoded_hash = hash_encode SOURCE_ID
    decoded_integer = hash_decode encoded_hash
 
    assert_equal SOURCE_ID, decoded_integer
  end
end