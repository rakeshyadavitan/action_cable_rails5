class Notification < ApplicationRecord
	#after_create_commit hook creates delayed job and passes notifications count to it
  after_create_commit { NotificationBroadcastJob.perform_later(Notification.count, self)}
end