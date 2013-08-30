class Button < ActiveRecord::Base
	validates :title, presence: true,
					  length: { minimum: 3 }
	validates :cmd, presence: true
	has_many :command

end
