class Relationship < ActiveRecord::Base
  attr_accessible :collaborator_id, :editor_id

  belongs_to :editor, class_name: "User"
  belongs_to :collaborator, class_name: "User"
  validates :editor_id, presence: true
  validates :collaborator_id, presence: true

  def self.collaborate!(owner, collaborator)
    Relationship.create(editor_id: owner.id, collaborator_id: collaborator.id)
  end
end
