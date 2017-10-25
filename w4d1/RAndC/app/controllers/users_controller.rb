class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: params
  end

  def create
    user = User.new(params[:user].permit(:email, :name))
    user.save!
    render json: user
  end
end
