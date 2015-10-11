class TopicPolicy < ApplicationPolicy

  def update?
    user.id == record.user_id  && record.interest_count == 0
  end

  def destroy?
    user.admin?
  end
end
