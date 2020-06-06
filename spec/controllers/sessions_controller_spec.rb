require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'GET #new' do
    context 'ログイン画面へのアクセス時' do
      before do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
      end

     it 'loginページへレンダリングする事' do
      post :create
      expect(response).to render_template :create
     end

    end
  end

  describe 'POST #create' do
    context 'ログイン認証が' do
      before do
        @user = create(:user)
      end

     it '成功すればmypageへリダイレクトする事' do
     　 create(:user)
      　post :create, { user: attributes_for(@user) } 
     　 expect(response).to redirect_to mypage_path
    end
  
    it '失敗すればloginpageへレンダリングする事' do
      post :create,  { user: attributes_for(@user) } 
      expect(response).to render_template :create
    end

  end

end
end




