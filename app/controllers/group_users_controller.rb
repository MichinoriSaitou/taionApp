class GroupUsersController < ApplicationController
   before_action :set_users 
   before_action :set_group


  def new
    @add = GroupUser.new(id: params[:group_id], id: params[:user_id])
  end

  def create
     @add = GroupUser.create(groupuser_params)
  if @add.save
     redirect_to mypage_path,  success: 'ユーザーを追加しました'
  else
     flash[:alert] = 'このユーザーは追加されています'
     render :new
  end

  end

  private

  def set_users
   @users = User.all
  end

  def set_group
   @group = current_user.groups.all
  end

  def groupuser_params
   params.require(:group_user).permit(:user_id, :group_id)
  end



end
