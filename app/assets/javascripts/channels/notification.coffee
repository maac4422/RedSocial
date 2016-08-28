App.notification = App.cable.subscriptions.create "NotificationChannel",
	connected: ->
		# Called when the subscription is ready for use on the server

	disconnected: ->
		# Called when the subscription has been terminated by the server

	received: (data) ->
		console.log ("Fuera")
		if data.action == "new_notification"
			conole.log("Dentro")
			snack(
				message: "Tienes una nueva notificacion",
				timeout:4000
			)
			$("#notification").html(data.message)
			