
class ShortenedUrl < ApplicationRecord
  include ActionView::Helpers

  before_save do
    hash_initialize

    self.hashid = hash_encode self.long_url.sum
  end
end
