class Relationship < ActiveRecord::Base
	attr_accessible :wiki, :collaborator, :collaborator_id

  belongs_to :wiki
  belongs_to :collaborator, class_name: "User"

  validates :wiki_id, presence: true
  validates :collaborator_id, presence: true
end
