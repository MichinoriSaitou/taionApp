require 'rails_helper'

Rspec.describe SessionsController, type: :controller do

  describe 'GET #new' do
    context 'ログイン画面へのアクセス時' do

     it 'loginページへレンダリングする事' do
      get :login
      expect(response).to render_template :login
     end

    end
  end

  describe 'POST #create' do
    context 'ログイン認証が' do

     it '成功すればmypageへリダイレクトする事' do
     　 create(:user)
      　post :create, { user: attributes_for(:user) } }
     　 expect(response).to redirect_to mypage_path
    end
  
    it '失敗すればloginpageへレンダリングする事' do
      post :create,  { user: attributes_for(:user) } }
      expect(response).to render_template :login
    end

  end

end
end




