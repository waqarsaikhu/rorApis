require 'jwt'
class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  
  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.credentials.jwt_secret_key)
  end

  def self.decode_jwt(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret_key)
    HashWithIndifferentAccess.new(decoded_token.first)
  rescue JWT::DecodeError => e
    nil
  end
end
