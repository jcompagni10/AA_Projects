class Cat < ApplicationRecord
  COLORS = %W[calico black white brown]
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: {in: COLORS,
    message: "%{value} is not a valid color for a cat"}
  validates :sex, length: {is: 1}

  def age
    (Date.today - birth_date).to_i / 365
  end

  def self.COLORS
    COLORS
  end

  def gender?(gender)
    return "checked" if sex == gender
  end

  def color?(clr)
    return "selected" if color == clr
  end

  has_many :cat_rental_requests,
    dependent: :destroy

end
