class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    @like = Like.new
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
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

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
     @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Movie successfully updated.'
    else
      render action: 'edit'
    end
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:name)
    end

end