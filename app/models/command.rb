class Command < ActiveRecord::Base
	after_initialize :default_values

	validates :button, presence: true
	belongs_to :button
	private
	def default_values
		self.status ||= 1
	end
end
