class MainController < ApplicationController
  def home
    @post= Post.new
    @posts =Post.all
  end

  def unregistered
  	
  end

  protected
	  def set_layout
		return "landing" if action_name == "unregistered"
		#else
		super  	
	  end
end
