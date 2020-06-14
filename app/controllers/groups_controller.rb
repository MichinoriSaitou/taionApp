class GroupsController < ApplicationController

  def new
    @group = Group.new
  end


  def create
    @group = Group.new(group_params)
  if  @group.save
    @group.users << current_user
    redirect_to group_path(@group), success: 'グループを作成しました'
  else
    flash[:alert] = 'このグループ名は存在します'
    render :new
  end
  end

  def show
    @group = Group.find_by(id: params[:id])
    user = current_user.id
    @post = Post.find_by(user_id: user)
  end

  def add_user
    @group = current_user.groups.all
    @users = User.where.not(id: current_user.id)
    @add = GroupUser.new(id: params[:group_id], id: params[:user_id])
  end

  def add_group
    @add = GroupUser.new(id: params[:group_id], id: params[:user_id])
     if @add.save
       redirect_to mypage_path, success: 'ユーザーを追加しました'
     else
       flash[:danger] = "このユーザーは追加済みです"
       render :add_user
     end
  end


  private

  def group_params
    params.require(:group).permit(:name)
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
