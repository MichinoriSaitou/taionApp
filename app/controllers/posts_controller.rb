class PostsController < ApplicationController

  def new
    @group = params[:group_id]
    @post= Post.new
    @user = current_user.id
  end

  def create
     @group = params[:group_id]
     @user = current_user.id
     @post = Post.new(post_params)
     @post.save
     redirect_to group_path(@group)
  end

  def edit
     @group = params[:group_id]
     @post = Post.find_by(user_id: current_user.id)
  end

  def update
     @group = params[:group_id]
     @post = Post.find_by(id: params[:id])
  if @post.update(update_params)
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


end


