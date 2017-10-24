class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :shares,
  class_name: :ArtworkShare,
  primary_key: :id,
  foreign_key: :viewer_id

  has_many :artworks,
  class_name: :Artwork,
  primary_key: :id,
  foreign_key: :artist_id

  has_many :shared_artworks,
  through: :shares,
  source: :artwork

  has_many :comments,
  class_name: :Comment,
  primary_key: :id,
  foreign_key: :user_id,
  dependent: :destroy

end
