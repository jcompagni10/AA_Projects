class TagTopic < ApplicationRecord

  has_many :taggings,
  class_name: :Tagging,
  primary_key: :id,
  foreign_key: :topic_id

  has_many :urls,
  through: :taggings,
  source: :shortened_url

end
