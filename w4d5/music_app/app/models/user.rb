class User < ApplicationRecord
  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, not_nill: false}

  after_initialize :ensure_session_token
  attr_reader :password


  has_many :notes

  def reset_session_token!
    token = rand_token
    self.session_token = token
    self.save
    token
  end

  def rand_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= rand_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end

  def valid_password?(password)
    digest = self.password_digest
    BCrypt::Password.new(digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)\
    user = User.find_by(email: email)
    if user && user.valid_password?(password)
      return user
    else
      return nil
    end
  end

end
