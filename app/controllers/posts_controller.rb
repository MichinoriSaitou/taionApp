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

  def update
    @group = params[:group_id]
    @post = Post.where(id: params[:id])
    @post.update(content: params[:content])
    redirect_to group_path(@group)
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :group_id)
  end


end


