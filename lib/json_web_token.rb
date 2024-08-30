class JsonWebToken
    def self.encode(payload, exp = 60.days.from_now.to_i)
      JWT.encode(payload.merge(exp: exp), Rails.application.credentials.jwt_secret_key)
    end
  
    def self.decode(token)
      decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret_key)
      HashWithIndifferentAccess.new(decoded_token.first)
    rescue JWT::DecodeError => e
      nil
    end
  end
  