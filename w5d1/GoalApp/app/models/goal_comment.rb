class GoalComment < ApplicationRecord
validates :body, presence: true

  belongs_to :user
  belongs_to :goal

end
