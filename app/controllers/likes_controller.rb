class LikesController < ApplicationController
  def create
    bookmark = Bookmark.find(params[:bookmard_id])
    
  end

  def destroy
  end
end
