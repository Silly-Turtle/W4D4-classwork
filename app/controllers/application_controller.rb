class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :login_user

  def login_user(user) #logs user in
    session[:session_token] = user.reset_session_token #reset returns session token and that is assigned to session's token

  end

  def logged_in?
    !!current_user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_user!
    redirect_to new_session_url if current_user.nil?
  end
end
# protect_from_forgery with: :exception
