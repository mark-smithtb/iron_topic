class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_interest_notification.subject
  #
  default from: 'msmith34683@gmail.com'
  add_template_helper(ApplicationHelper)

  def new_interest_notification(topic, interest)
    @topic = topic
    @interest = interest


    mail(to: @topic.user.email, subject: "New rating or comment.")
  end
end
