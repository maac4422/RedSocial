module Notificable
	extend ActiveSupport::Concern

	included do
		has_many :notifications, as: :item 
		after_commit :send_notifications_to_users
	end

	def send_notifications_to_users
		if self.respond_to? :user_ids
			#JOB => Mandar notificaciones asincronas
			NotificationSenderJob.perform_later(self)
		end
	end
end