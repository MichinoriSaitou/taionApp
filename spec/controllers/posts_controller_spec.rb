require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "POST #new" do

    context '@postがsaveされた場合' do
      before do
        group =  Group.new({
          name: 'sample1',
          id: '1'
        })
        get :create, params: { group_id: 1}
      end

      it 'POSTが新規に作成される事' do
        @post = create(:post)
        expect(@post.save).to change(Post, :count).by(1)
      end

      it 'グループ画面にリダイレクトする事' do
        @post = create(:post)
        expect(@post.save).to redirect_to(group_path)
      end
      
    end
  end


end
