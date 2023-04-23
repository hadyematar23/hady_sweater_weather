class Api::V0::UsersController < ApplicationController
  wrap_parameters :user, include: [:email, :password, :password_confirmation]
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user).serialize_user, status: 201
    else 
      render json: ErrorSerializer.new.serialize_user_error(user.errors.full_messages), status: determine_status_code(user.errors.full_messages)
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def determine_status_code(errors)
    if errors.first == "Email has already been taken"
      409
    else 
      400
    end
  end
end
