class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :public, :user_id
  belongs_to :user
  validate :is_foo, on: :update

  has_many :collaborators

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }
  
  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
<<<<<<< HEAD
  def test
    puts "hi"
  end
  def is_foo
    logger.info "reached"
    if body != "foo"
      errors.add(:body, "is not foo.")
    end
  end
=======

  has_many :relationships
  has_many :collaborators, through: :relationships

  def can_edit?(user)
  	collaborators.include? user
  end

   def collaborate!(other_user)
    relationships.create!(collaborator_id: other_user.id)
  end

  def clear_before_update
    relationships.delete_all
  end


>>>>>>> old-state
end
