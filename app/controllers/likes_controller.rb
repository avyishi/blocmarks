class LikesController < ApplicationController
  def create
    respond_to do |format|
    format.html { .. your liking code .. }
    format.js {.. your liking code .. }
     
    @bookmark = Bookmark.find(params[:bookmark])
     like = current_user.likes.build(bookmark: bookmark)

     if like.save
      redirect_to :back, notice: "Blocmark liked!"
    else
      flash[:error] = "There was an error liking this blocmark, please try again"
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find_by(bookmark: @bookmark)

    if like.destroy
      redirect_to :back, notice: "Blocmark unliked!"
    else
      flash[:error] = "There was an error unliking this blocmark, please try again"
      redirect_to :back
    end
  end

              