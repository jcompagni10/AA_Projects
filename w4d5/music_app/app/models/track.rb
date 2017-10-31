class Track < ApplicationRecord
  validates :title, :ord, :album_id, presence: true
  validates_inclusion_of :is_regular, in: [true, false]

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes

    def band_name
      band.name
    end

    def album_title
      album.title
    end
end
