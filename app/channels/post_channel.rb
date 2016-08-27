# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PostChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "posts_#{current_user.id}" #Demo funciona como sala
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


end
