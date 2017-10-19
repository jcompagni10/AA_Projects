class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, uniqueness: true, presence: true
  validates :user_id, presence: true
  validate :no_spamming, :premium_limit

  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :shortened_url_id

  has_many :visitors,
  -> { distinct },
  through: :visits,
  source: :visitor

  has_many :taggings,
  class_name: :Tagging,
  primary_key: :id,
  foreign_key: :topic_id

  has_many :tags,
  through: :taggings,
  source: :tag_topic

  def self.make_short_url(user, long_url)
    short_code = self.random_code
    record = new(short_url: short_code, long_url: long_url, user_id: user.id)
    if record.valid?
      record.save
    end
    record
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while self.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def num_clicks
    visits.length
  end

  def num_uniques
    #Visit.select(:user_id).where(shortened_url_id: self.id).distinct.count
    visitors.count
  end

  def num_recent_uniques
    visits.where({created_at: (Time.now-60.minutes)..Time.now}).select(:user_id).distinct.count
  end

  def no_spamming

    num_recent = ShortenedUrl.where(user_id: self.user_id, created_at: (Time.now - 2.minute)..Time.now)
    num_recent= num_recent.count
    puts "you have submitted #{num_recent} in the last 2 minutes"
    if num_recent > 5
      self.errors.add(:user_id, "user cannot submit more than 5 links in a minute")
    end

  end

  def premium_limit

    total_links = ShortenedUrl.where(user_id: self.user_id)
    total_count= total_links.count
    if total_count > 5
      self.errors.add(:user_id, "non-premium limit reached")
    end
  end


end
