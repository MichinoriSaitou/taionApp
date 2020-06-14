require 'rails_helper'

RSpec.describe GroupUsersController, type: :controller do

  describe "GET #new"  do
    before {get :new}

    it 'newテンプレートをレンダリングする事' do
      expect(response).to render_template :new
    end

    it 'addgroupオブジェクトがビューに渡される事' do
      expect(assigns(:groupuser)).to be_a_new GroupUser
    end
  end

  describe 'POST #create' do
    context 'group_idとuser_idが渡ってきた場合' do

      it  'レコードが追加される事' do
        @add = GroupUser.create(group_id: 1,user_id: 1)
        expect(@add.save).to change(GroupUser, :count).by(1)
      end
    end
  end

end
