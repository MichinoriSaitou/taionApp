class UsersController < ApplicationController

  def new
    @user = User.new(flash[:user])
  end

  def create
    @user =  User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to mypage_path, success: '新規登録完了'
    else
      redirect_to :back, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  def me
     @group = current_user.groups
     @mygroup = Group.find_by(id: params[:id])
  end


  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
