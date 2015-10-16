class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]
  def new
    @interest = Interest.new
    @topic = Topic.find(params[:topic_id])
    @rated = current_user.interests.where(topic_id: params[:topic_id]).where("score is not null")
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    @topic = Topic.find(params[:topic_id])
    @interest = @topic.interests.new(interest_params)
    @interest.user_id = current_user.id
    @interest.save
    score = @interest.score.to_i
    @topic.interest_score += score
    @topic.rating = @topic.interest_score / @topic.interests.where("score is not null").count
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
    params.require(:interest).permit(:comment, :score, :parent_id)
  end

end
