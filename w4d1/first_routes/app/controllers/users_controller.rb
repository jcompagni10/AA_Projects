class UsersController < ApplicationController
  def index
    if params[:username]
      if users = User.where("username like \'%#{params[:username]}%\'")
        render json: users
      else
        render json: "no users found"
      end
    else
      @users = User.all
      render json: @users
    end
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user= User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: user
    else
      render plain: "User doesn't exist"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end


end
