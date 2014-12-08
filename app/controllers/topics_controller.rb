class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    @like = Like.new
   # @topics = @topics.sort {|a, b| b.bookmarks <=> a.bookmarks }
  end

  def new
    @topic = Topic.new
  end

  def show
    #@topic = Topic.find_by_name(params[:id])
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :public))
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
      #@topic = Topic.find_by_name(params[:name])
    #unless @topic
      #@topic = Topic.new(name: params[:name])
      #@topic.save
    #end
  #end
   end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic successfully updated.'
    else
      render action: 'edit'
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

  

  private
    def topic_params
      params.require(:topic).permit(:name)
    end

end