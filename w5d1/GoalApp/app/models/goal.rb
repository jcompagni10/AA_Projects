class Goal < ApplicationRecord
  validates :title, presence: true
  validates_inclusion_of :public, :completed, in: [true, false]

  belongs_to :user
  has_many :goal_comments


  def mark_as_completed
    update(completed: true)
  end
end
