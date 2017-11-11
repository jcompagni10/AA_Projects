class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, empty: false

  has_many :post_subs
  has_many :subs, through: :post_subs

  belongs_to :author,
  class_name: :User,
  foreign_key: :author_id

  has_many :comments,
  dependent: :destroy


  def comments_by_parent
    all_comments = Hash.new(){[]}
    self.comments.each do |comment|
      all_comments[comment.parent_id] << comment
    end
  end
end
