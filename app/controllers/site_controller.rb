class SiteController < ApplicationController
  def index
    @bookmarks = Bookmark.order('Created_at desc')
  end

  def today
    @time = Time.now
  end
end
