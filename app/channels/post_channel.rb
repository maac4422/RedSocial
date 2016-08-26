# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PostChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "demo" #Demo funciona como sala
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def echo(data)
  	ActionCable.server.broadcast"demo", data #Enviarle infromacion a los clientes de la sala demo
  end
end
