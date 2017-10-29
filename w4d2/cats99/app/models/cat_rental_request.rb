class CatRentalRequest < ApplicationRecord
  validates :start_date, :end_date, :status, presence: true
  validate :overlaps, :timetravel

  belongs_to :cat


  def timetravel
    if start_date > end_date || start_date < Date.today
      errors[:start_date] << "No time travel with cats allowed (cats don't understand space time continium)"
    end
  end

  def over_lapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where.not("end_date < ?", self.start_date)
      .where.not("? < start_date", self.end_date)
  end

  def overlapping_pending_requests
    over_lapping_requests.where(status: "PENDING")
  end

  def overlaps
    if over_lapping_requests.where(status: 'APPROVED').exists?
      errors[:start_date] << 'Cat ship has sailed!!!'
    end
  end

  def approve!
    # raise "status not pending" unless status == "PENDING"
    CatRentalRequest.transaction do
      self.update(status: "APPROVED")
      overlapping_pending_requests.update_all(status: "DENIED")
    end

  end

  def pending?
    status == "PENDING"
  end

  def deny!
    self.update(status: "DENY")
  end


  def self.test
    p CatRentalRequest.new(cat_id: 6,
                            start_date: Date.new(2017, 9, 6),
                            end_date: Date.new(2017, 10, 2),
                            status: 'APPROVED').valid?
    p CatRentalRequest.new(cat_id: 6,
                            start_date: Date.new(2017, 10, 2),
                            end_date: Date.new(2017, 10, 4),
                            status: 'APPROVED').valid?
    p CatRentalRequest.new(cat_id: 6,
                            start_date: Date.new(2017, 9, 6),
                            end_date: Date.new(2017, 10, 5),
                            status: 'APPROVED').valid?
    p CatRentalRequest.new(cat_id: 6,
                            start_date: Date.new(2017, 10, 2),
                            end_date: Date.new(2017, 10, 2),
                            status: 'APPROVED').valid?
    p CatRentalRequest.new(cat_id: 6,
                            start_date: Date.new(2016, 10, 6),
                            end_date: Date.new(2017, 10, 6),
                            status: 'APPROVED').valid?
    p CatRentalRequest.new(cat_id: 6,
                            start_date: Date.new(2017, 11, 4),
                            end_date: Date.new(2017, 11, 5),
                            status: 'APPROVED').valid?


  end

end
