class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :logged_in

  def current_user
    if session[:type] == "agency"
      return Agency.find(session[:id]) if session[:id]
    elsif session[:type] == "user"
      return User.find(session[:id]) if session[:id]
    end
  end

  helper_method :current_user

  private
    def logged_in
      if !session[:id]
        redirect_to '/'
      end
    end
end
