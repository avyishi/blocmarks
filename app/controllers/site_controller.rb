class SiteController < ApplicationController
  def index
    @bookmarks = Bookmark.order('Created_at desc')
  end
end
