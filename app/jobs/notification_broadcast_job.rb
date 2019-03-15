class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(counter,notification)
  	#we passed counter to perform job action, which broadcasts this new value to ActionCable notification_channel that we have created earlier.
  	#We are passing notification to perform, from there we are passing it to ActionCable but first we render it as partial. (Same as counter)
    ActionCable.server.broadcast 'notification_channel',  counter: render_counter(counter), notification: render_notification(notification)
  end

  private

  def render_counter(counter)
  	# we made it broadcast whole partial with updated counter value.
    ApplicationController.renderer.render(partial: 'notifications/counter', locals: { counter: counter })
  end

  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end

end