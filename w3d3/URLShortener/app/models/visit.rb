class Visit < ApplicationRecord
  validates :shortened_url_id, :user_id, presence: true

  belongs_to :visitor,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  belongs_to :short_url,
  class_name: :ShortenedUrl,
  primary_key: :id,
  foreign_key: :shortened_url_id

  def self.record_visit!(user, shortened_url)
    record = new(shortened_url_id: shortened_url.id, user_id: user.id)
    record.save
    record
  end

end
