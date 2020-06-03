rrequire 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
     before {get :new}

     it 'newテンプレートをレンダリングすること' do
        expect(response).to render_template :new
     end

     it  'userオブジェクトがビューに渡される事' do
        expect(assigns(:user)).to be_a_new User
     end

    end

    describe 'POST #create' do
     context 'ユーザー情報が渡ってきた場合' do
        let(:params) do
            { user: {
                name: 'user',
                email: 'xxx@user.jp',
                password: 'password',
                password_confirmation: 'password', }}
        end

        it 'ユーザーが増える事' do
            expect{post :create, params: params }.to change(User, :count).by(1)
        end

        it 'マイページにリダイレクトされる事' do
            expect(post :create, params: params).to redirect_to(mypage_path)
        end

     end 

    end
end
