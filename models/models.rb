class ShortenedUrl < ActiveRecord::Base
  validates_uniqueness_of :url
  validates_presence_of :url
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  
  def shorten
    self.id.alphadecimal
  end
  
  def self.find_by_shortened(shortened)
    find(shortened.alphadecimal)
  end
end