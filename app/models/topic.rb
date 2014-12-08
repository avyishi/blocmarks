class Topic < ActiveRecord::Base
  has_many :bookmarks#, dependent: :destroy
  has_many :likes
  default_scope { order('created_at DESC') } 

  validates :name, length: {minimum: 5}, presence: true
end
