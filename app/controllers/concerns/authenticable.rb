module Authenticable
    def authenticate_request
      header = request.headers['Authorization']
      token = header.split(' ').last if header
      @decoded = JsonWebToken.decode(token)
      @current_user = User.find(@decoded[:id]) if @decoded
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end
  