class Api::V1::LoginController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(user_params[:password])
      render json: { message: 'User loggedIn Successfully', token: user.generate_jwt }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
