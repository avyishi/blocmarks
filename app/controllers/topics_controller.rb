class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @like = Like.new
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:user])
    @bookmarks = @topic.bookmarks
  end

  def create
    @topic = Topic.find_by_name(params[:name])
    unless @topic
      @topic = Topic.new(name: params[:name])
      @topic.save
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    name = @topic.name

    if @topic.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end
