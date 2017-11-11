class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :all_comments


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    redirect_to new_session_url unless current_user
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def all_comments(post = nil)
    post ||= Post.find(params[:id])
    @all_comments ||= post.comments.includes(:author, :children)
  end

end
