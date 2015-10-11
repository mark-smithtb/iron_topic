class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]


  def index
    # # client = Octokit::Client.new({ access_token: current_user.access_token, client_id: ENV['GITHUB_APP_ID'] , client_secret: ENV['GITHUB_APP_SECRET']})
    #  user = client.user
    #  user.login
    # byebug
    # @organizations = client.user.organizations(current_user.nickname)
    @topics = Topic.all.order(rating: :desc).page(params[:page])
  end

  def newest
    @topics = Topic.all.order(created_at: :desc).page(params[:page])
    render :index
  end

  def search
    @topics = Topic.search(params[:q]).page(params[:page])
    render :index
  end

  def show
    @interests = @topic.interests.order(created_at: :desc).page(params[:page])
  end

  def edit
    authorize(@topic)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to @topic
  end

  def destroy
    authorize(@topic)
    @topic.destroy
    @topic.save
    redirect_to topics_url
  end

  def update
    authorize(@topic)
    @topic.update(topic_params)
    redirect_to @topic
  end

private

def set_topic
    @topic = Topic.find(params[:id])
  end

def topic_params
  params.require(:topic).permit(:title, :focus_area,:description)
end

end
