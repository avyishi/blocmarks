class Bookmark < ActiveRecord::Base
  #include SimpleHashtag::Hashtaggable


  belongs_to :user
  has_many :likes

  validates :user_id, presence: true
  validates :title, length: {minimum: 10}, presence: true
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
