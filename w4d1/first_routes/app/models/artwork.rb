class Artwork < ApplicationRecord
  validates :image_url, :title, presence: true
  validates :title, uniqueness: {scope: :artist_id}

  has_many :shares,
  class_name: :ArtworkShare,
  primary_key: :id,
  foreign_key: :artwork_id

  belongs_to :artist,
  class_name: :User,
  primary_key: :id,
  foreign_key: :artist_id

  has_many :shared_viewers,
  through: :shares,
  source: :viewer

  has_many :comments,
  class_name: :Artwork,
  primary_key: :id,
  foreign_key: :artwork_id,
  dependent: :destroy
end
