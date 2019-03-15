App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#notificationList').prepend "#{data.notification}"
    this.update_counter(data.counter)

#We have added update_counter function, that is triggered whenever stream receives data. update_counter  functions changes text of the counter to a new number, and does it using transition from the top.To make it work we need to pass new counter value to the stream.


  update_counter: (counter) ->
    $counter = $('#notification-counter')
    val = parseInt $counter.text()
    val++
    $counter
    .css({opacity: 0})
    .text(val)
    .css({top: '-10px'})
    .transition({top: '-2px', opacity: 1})