class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  has_many :wikis
  before_create :set_member
  has_many :relationships, foreign_key: "wiki_id", dependent: :destroy
  #has_many: collaborator_users, through: :relationships, source :collaborator
  has_many :reverse_relationships, foreign_key: "collaborator_id", class_name:  "Relationship",dependent: :destroy
  has_many :collaborators, through: :reverse_relationships, source: :collaborator

  ROLES = %w[member premium_member admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end 
  
  def collaborating?(other_user)
    relationships.find_by(collaborator_id: other_user.id)
  end

  def uncollaborate!(other_user)
    relationships.find_by(collaborator_id: other_user.id).destroy!
  end

  private

  def set_member
    self.role = 'member'
  end
end
