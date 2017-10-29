class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticity_token, :current_user, :all_bands, :all_albums

  def authenticity_token
    html = "<input type='hidden' name='authenticity_token' value = '<%=authenticity_token%>'\> "
    html.html_safe
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    return @current_user if @current_user
    return false
  end

  def log_in_user!(user)
    token = user.ensure_session_token
    session[:session_token] = token
  end

  def all_bands
    Band.all
  end

  def all_albums
    Album.all
  end

  def verify_login
    redirect_to new_session_url unless current_user
  end


end
