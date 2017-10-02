# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
validates :email, :password_digest, :session_token, presence:true
validates :password, length: {length:6, allow_nil:true}

after_initialize :ensure_session_token
attr_reader :password

def self.find_by_credentials(username, password)
  user = User.find_by(username: username)
  return nil unless user && user.valid_passsword?(password)
  user
end

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def valid_passsword?(password)
  BCrypt::Password.new(self.password_digest).is_password?(password)
end

def reset_session_token
  self.session_token = SecureRandom.urlsafe_base64
  self.save!
  self.session_token
end

private
def ensure_session_token
  self.session_token ||= SecureRandom.urlsafe_base64
end

end
