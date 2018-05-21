require 'test_helper'
include HashidHelper

# Tests the ShortenedUrl Model
# Only Create and Get will be tested, since these are the only methods needed.
# Let's not overengineer
class ShortenedUrlTest < ActiveSupport::TestCase
  # Setup - initialize the hash helper
  setup do
    hash_initialize
  end
  
  # test Save a ShortenedUrl object
  test "should create/save a ShortenedUrl object." do
    shortened_url = ShortenedUrl.new
    shortened_url.long_url = "https://www.google.com"
    shortened_url.save

    assert shortened_url.id > 0
  end

  # test that the saved ShortenedUrl has the hashid saved. We test by reversal
  test "- the hashid of the ShortenedUrl object should be auto computed on save." do
    shortened_url = ShortenedUrl.new
    shortened_url.long_url = "https://www.google.com"
    shortened_url.save

    assert hash_decode(shortened_url.hashid)==shortened_url.long_url.sum
  end

  # test that the saved ShortenedUrl has the hashid saved. We test by reversal
  test "should be able to retrieve a Shortened URL based on a hash" do
    hashid = hash_encode "https://www.google.com".sum

    shortened_url = ShortenedUrl.new
    shortened_url.long_url = "https://www.google.com"
    shortened_url.save

    retrieved_record = ShortenedUrl.find_by_hashid hashid

    assert retrieved_record.id == shortened_url.id
  end
end
