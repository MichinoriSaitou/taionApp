class PostsController < ApplicationController

  def new
    @post= Post.new(id: params[:id])
  end

  def create
     @group = params[:group_id]
     @post = Post.new(content: params[:content], user_id: current_user.id, group_id: params[:group_id])
     @post.save
     redirect_to group_path(@group)
  end

  def destroy
    @post = Post.find(params[:id])
    if @Post.destroy
      redirect_to mypage_path
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end


