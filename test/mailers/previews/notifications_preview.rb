# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/new_interest_notification
  def new_interest_notification
    @topic = Topic.first
    Notifications.new_interest_notification(@topic, @topic.interests.first)
  end

end
