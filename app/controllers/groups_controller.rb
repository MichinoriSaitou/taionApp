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



  private

  def group_params
    params.require(:group).permit(:name)
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
