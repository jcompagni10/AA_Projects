class Album < ApplicationRecord
  validates :title, :yr, presence: true
  validates_inclusion_of :is_live, in: [true, false]


  belongs_to :band

  has_many :tracks

  def band_name
    band.name
  end
end
