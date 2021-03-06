class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login(@user)
      render :show
    else
      render json: ['Invalid login'], status: 422
    end
  end

  def destroy
    if current_user
      logout
      render json: {}
    else
      render json: {}, status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
