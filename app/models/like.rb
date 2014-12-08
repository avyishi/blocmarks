class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
  belongs_to :topic
end
