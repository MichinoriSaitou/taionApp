class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
       @group = Group.new(group_params)
    if @group.save
       @group.users << current_user
       redirect_to group_path(@group), success: 'グループを作成しました'
    else
       render :new
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  def mygroup
  end

  def add_user
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
