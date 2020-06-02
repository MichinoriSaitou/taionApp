class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path, success: 'ログインしました'
    else
      render  'top/index'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end
end


