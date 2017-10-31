class UserComment < ApplicationRecord
validates :body, presence: true

  belongs_to :user

  belongs_to :commentee,
  primary_key: :id,
  foreign_key: :commentee_id,
  class_name: :User

end
