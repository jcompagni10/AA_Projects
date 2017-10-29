class UserSession < ApplicationRecord
  validates :user_id, presence: true
  validates :session_token, presence: true, uniqueness: true

  belongs_to :user

  def initialize(user)
    @user = user
    @session_token = ensure_session_token
  end
end

# class User < ApplicationRecord

#   after_initialize :ensure_session_token

#   def ensure_session_token
#     self.session_token ||= SecureRandom::urlsafe_base64
#   end
#
#   def reset_session_token!
#     st = SecureRandom::urlsafe_base64
#     self.update(session_token: st)
#     st
#   end
#
#   def password=(password)
#     @password = password
#     self.password_digest = BCrypt::Password.create(password)
#   end
#
#   def is_password?(password)
#     db_pass = BCrypt::Password.new(self.password_digest)
#     db_pass.is_password?(password)
#   end
#
#   def self.find_by_credentials(username, password)
#     user = User.find_by(username: username)
#     if user && user.is_password?(password)
#       return user
#     else
#       return nil
#     end
#   end
#
# end
