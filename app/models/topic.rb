class Topic < ActiveRecord::Base
  has_many :bookmarks
  has_many :bookmarks, dependent: :destroy




  validates :name, length: {minimum: 5}, presence: true
end
