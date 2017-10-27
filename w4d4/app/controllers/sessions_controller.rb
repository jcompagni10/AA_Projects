class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:new]

  def create
    @user = User.find_by_credentials(params[:user][:username],
                            params[:user][:password])
    if @user
      # @user.user_sessions.new(generate_session_token)
      token = @user.reset_session_token!
      session[:session_token] = token
      flash[:name] = @user.username
      redirect_to cats_url
    else
      flash.now[:errors] = ["Password Username combination is incorrect"]
      render :new
    end
  end

  def new
    fail
    render :new #log in
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    else
      render json: "No current user"
    end
  end


end
