# Makes use of the hashids gem
# Purpose is to generate hashid from an integer
# The hashes will become the identifier of the shortened URLs.
module HashidHelper
  # Initialize the hasher
  # @param salt - the salt to use to encode
  # @param min_length - the minimum length of the hash
  def hash_initialize(salt="Lorem Ipsum", min_length=8)
    @hasher = Hashids.new salt, min_length
  end
  # Encodes an interger into a hash
  # @param i - integer to encode
  def hash_encode(i)
    @hasher.encode i
  end

  # Decodes an hash back to the integer
  # @param hashi - integer to encode
  def hash_decode(hashid)
    @hasher.decode(hashid)[0]
  end
end