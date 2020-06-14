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
        user =  user = User.new ({
          name:  'テスト太郎',
          email: 'tesuto@xxx.jp',
          password: '111111'
        })
        allow(User).to receive(:find_by).and_return(user)
      end

     it '成功すればmypageへリダイレクトする事' do
       post :create, session: { email: 'tesuto@xxx.jp', password: '111111'}
     　 expect(response).to redirect_to mypage_path
    end
  
    it '失敗すればloginpageへレンダリングする事' do
      post :create, session: { user_id: 1, password: 1111111}
      expect(response).to render_template :create
    end

  end
end
end




