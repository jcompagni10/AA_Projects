class Bench < ApplicationRecord
  validates :description, :lat, :lng, presence: true;

  def self.in_bounds(bounds)
    e = bounds.e
    w = bounds.w
    n = bounds.n
    s = bounds.s
    Bench.where("lat between ? AND ? ", s, n).where("lng between ? and ?", w, e)
  end
end
