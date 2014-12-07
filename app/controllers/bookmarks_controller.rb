class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.all
  end
  
  def show
   @bookmark = Bookmark.find(params[:id])
   @topic = Topic.find(params[:topic_id])
  end

  def new
    @bookmark = current_user.bookmarks.new
   # @topic = Topic.find(params[:topic_id])
  end

  def edit
  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  def like
    bookmark = resource.like current_user
    Event.bookmark_liked!(bookmark)
    redirect_to discussion_url(resource.discussion)
  end

  def unlike
    resource.unlike current_user
    redirect_to discussion_url(resource.discussion)
  end

  private
    def set_bookmark
      unless @bookmark = current_user.bookmarks.where(id: params[:id]).first
      flash[:alert] = 'Bookmark not found.'
      redirect_to root_url
    end
  end

    def bookmark_params
      params.require(:bookmark).permit(:title, :url)
    end
end
