class Api::V1::UsersController < ApplicationController
  def create
    if User.exists?(email: user_params[:email])
      render json: { message: 'User already exists with this email' }, status: :unprocessable_entity
      return
    end

    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully', user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
