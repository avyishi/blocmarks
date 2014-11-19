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
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.find_by_name(params[:name])
    if @topic.save
      redirect_to @topic
    else
      render action: 'show'
    end
  end

  def update
    #if @topic.update
     # redirect_to @topic, notice: 'Topic was successfully updated.'
    #else
     # render action: 'edit'
   # end
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
