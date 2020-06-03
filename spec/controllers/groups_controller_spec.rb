require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

    describe 'POST #create'  do
     context '@groupがsaveされた場合' do
        let(:params) do
            { group: {name: 'group'}}
        end

       it 'マイページへリダイレクトされる事' do
        expect(post :create, params: params).to redirect_to(mypage_path)
       end

       it 'グループが増える事' do
        expect(post: create, parmas: params).to change(Group, :count).by(1)
       end

       
     end
    end
    
    describe 'POST #create'  do
     context '@groupのsaveに失敗した場合' do
        let(:group) do
            ( Group.new(name: ''))
        end

        it 'falseが返される事' do
            expect(group.save).to be_falsy
        end

        it 'newテンプレートにレンダリングされる事' do
            get :new
            expect(response).to render_template(:new)
        end


     end
    end


end
