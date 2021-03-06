class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    if session[:user_id]
       return User.find(session[:user_id])
    end
  end

  def authenticate
    unless current_user
      flash[:notice] = "Sed.t says'Yo gotta login for this action'"
      redirect_to login_path
    end
  end
end
