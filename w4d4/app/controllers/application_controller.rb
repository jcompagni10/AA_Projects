class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :correct_owner?

  def current_user
    # fail
    session_token = session[:session_token]
    if session_token
      @user ||= User.find_by(session_token: session_token)
      #session_tokens.find_by(session_token: session_token).env
      # @user.sessions_tokens
      return @user if @user
    end
    nil
  end

  def require_logged_in
    if current_user
      redirect_to cats_url
    end
  end

  def correct_owner?
    @cat ||= Cat.find_by(id: params[:id])
    @cat.owner == current_user
  end

  def check_owner
    #risk of wrong id from params
    redirect_to cats_url unless correct_owner?
  end

end
