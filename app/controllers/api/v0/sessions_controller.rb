class Api::V0::SessionsController < ApplicationController
  wrap_parameters :session, include: [:email, :password]
  def create
    user = User.find_by(email: params[:session][:email])
    if user 
      if user != nil && user.authenticate(params[:session][:password])
        render json: SuccessSerializer.new.serialize_success(user), status: 200 
      else 
        render json: ErrorSerializer.new.serialize_login_error, status: 401
      end
    else 
      render json: ErrorSerializer.new.serialize_login_error, status: 401
    end 
  end

  private 

  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation)
  end
end
