require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
    
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
