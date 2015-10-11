class TopicPolicy < ApplicationPolicy

  def update?
    topic.created_by == current_user && topic.interest_count == 0
  end

  def destroy?
    user.admin?
  end
