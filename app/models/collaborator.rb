class Collaborator < ActiveRecord::Base
	attr_accessible :user_id, :wiki_id

	belongs_to :wiki
	belongs_to :user

	def user_can_edit(user)
		# pick back up from here
	end
end