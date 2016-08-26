class FriendshipDecorator < Draper::Decorator
  delegate_all

  def user_view
    (h.current_user == object.user) ? object.friend : object.user
  end

  def status
  	return "Aceptada" if object.active?

  	return "Denegada" if object.denied?

   end


  def confirm_button
  	button = h.link_to "Aceptar", h.friendship_path(object,status: 1) ,method: :patch, class:"right-space mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
  	return button.html_safe
  end

  def denegate_button
  	button = h.link_to "Denegar", h.friendship_path(object,status: 0),method: :patch , class:"right-space mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
  	return button.html_safe
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
