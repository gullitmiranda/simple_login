class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  private
  # exige q o usuário esteja logado
  def require_login
    redirect_to new_sessions_path unless session[:user_id] || controller_name == "sessions"
  end
end
