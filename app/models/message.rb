class Message < ApplicationRecord
  after_create_commit { notify }

  private

  def notify
  	#we are passing “self.body”, this way we will able to see message body in our modal.
    Notification.create(event: "New Notification (#{self.body})")
  end
end