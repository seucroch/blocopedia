class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :public
  belongs_to :user

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }
  
  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
end
