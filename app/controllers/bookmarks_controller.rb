class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.all

  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
   @bookmark = Bookmark.find(params[:id])
  end

  # GET /bookmarks/new
  def new
    @bookmark = current_user.bookmarks.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      unless @bookmark = current_user.bookmarks.where(id: params[:id]).first
      flash[:alert] = 'Bookmark not found.'
      redirect_to root_url
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title, :url)
    end
end
