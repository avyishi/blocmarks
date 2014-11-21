class Bookmark < ActiveRecord::Base
  #include SimpleHashtag::Hashtaggable


  belongs_to :user
  has_many :likes, dependent: :destroy
  belongs_to :topic
  default_scope { order('created_at DESC') } 

  validates :user_id, presence: true
  validates :title, length: {minimum: 5}, presence: true
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
