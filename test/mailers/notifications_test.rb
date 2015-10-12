require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "new_interest_notification" do
    mail = Notifications.new_interest_notification
    assert_equal "New interest notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
