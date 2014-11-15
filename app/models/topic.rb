class Topic < ActiveRecord::Base
  has_many :bookmarks
  has_many :bookmarks, dependent: :destroy
end
