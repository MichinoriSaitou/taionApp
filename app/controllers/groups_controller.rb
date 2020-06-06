class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
       @group = Group.new(group_params)
  if   @group.save
       @group.users << current_user
       redirect_to group_path(@group), success: 'グループを作成しました'
  elsees
       render :new
  end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @post = @group.posts
  end

  def add_user
    @group =  params[:id]
    @users = User.where.not(id: current_user.id)
  end

  def mygroup
    @group = current_user.groups.all
    @add = GroupUser.create(id: params[:group_id], id: params[:user_id])
  end


  private

  def group_params
    params.require(:group).permit(:name)
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end