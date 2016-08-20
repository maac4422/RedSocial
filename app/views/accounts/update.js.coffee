$("#user-avatar .circle").css
	"background": "url(<%= @user.avatar.url(:thumb) %>)"
	"background-size": "cover"

$("#user-cover").css
	"background": "url(<%= @user.cover.url(:medium) %>)"
	"background-size": "cover"
	"background-position": "center"