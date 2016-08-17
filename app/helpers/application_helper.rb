module ApplicationHelper
	def resource
		#Si la variable resource no existe asignarle User.new
		@resource ||= User.new
	end

	def resource_name
		:user	
	end

	def resource_class
		User
	end

	def circle_img url,size=50
		div = content_tag(:div,"",
			class:"circle cover",
			style:"height:#{size}px;width:#{size}px;background-image:url(#{url})")
		div.html_safe
	end
end
