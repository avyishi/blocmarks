class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.all
  end
  
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    #@bookmark = current_user.bookmarks.new(bookmark_params)
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:title))
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render action: 'new'
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    #if @bookmark.update(bookmark_params)
    if @bookmark.update_attributes(params.require(:bookmark).permit(:title))
      flash[:notice] = "Bookmark was updated."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
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
