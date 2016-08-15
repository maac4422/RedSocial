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
end
