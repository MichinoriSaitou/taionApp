class PostsController < ApplicationController
  before_action :set_group

  def new
    @post= Post.new
    @user = current_user.id
  end

  def create
     @user = current_user.id
     @post = Post.new(post_params)
     @post.save
     redirect_to group_path(@group)
  end

  def edit
     user = current_user.id
     @post = Post.find_by(user_id: user)
  end

  def update
     @post = Post.find_by(id: params[:id])
  if @post.update(update_params)
     @post.touch(:created_at)
     flash[:notice] = "体温を更新しました"
     redirect_to group_path(@group)
  end

  end 

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :group_id)
  end

  def update_params
    params.require(:post).permit(:content)
  end

  def set_group
    @group = params[:group_id]
  end


end


