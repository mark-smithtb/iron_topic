class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]




  def create
    @topic = Topic.find(params[:topic_id])
    @interest = @topic.interests.new(interest_params)
    @interest.user_id = current_user.id
    @interest.save
    score = @interest.score
    @topic.interest_score += score
    @topic.rating = @topic.interest_score / @topic.interests_count
    @topic.save
    Notifications.new_interest_notification(@topic, @interest).deliver
    redirect_to @topic
  end

  def destroy
    @topic = topic.find(params[:topic_id])
    @interest.destroy
    @topic.interest_score -= @interest.score
    @interest.save
    redirect_to interests_url
  end

  # def update
  #   @interest.update(interest_params)
  #   redirect_to
  # end

  private

  def set_interest
    @interest= Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:comment, :score)
  end

end
