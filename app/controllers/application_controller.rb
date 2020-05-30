class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  

  private

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

end
