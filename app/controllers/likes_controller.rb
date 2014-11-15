class LikesController < ApplicationController
  
  def create
     
    @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
     #authorize like
     if like.save
      redirect_to :back, notice: "Bookmark liked!"
    else
      flash[:error] = "There was an error liking this blocmark, please try again"
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find_by(bookmark: @bookmark)
    #authorize like
    if like.destroy
      redirect_to :back, notice: "Bookmark unliked!"
    else
      flash[:error] = "There was an error unliking this blocmark, please try again"
      redirect_to :back
    end
  end
end

              