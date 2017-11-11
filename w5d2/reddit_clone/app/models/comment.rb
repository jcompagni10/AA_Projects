class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :post,
  class_name: :Post,
  foreign_key: :post_id

  belongs_to :author,
  class_name: :User


  belongs_to :parent,
  class_name: :Comment,
  optional: true

  has_many :children,
  class_name: :Comment,
  foreign_key: :parent_id

end
