require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validates'  do
    context '名前、メアド、パスワードが正しければ' do
      it '有効である事'  do
        user = User.new ({
          name:  'テスト太郎',
          email: 'tesuto@xxx.jp',
          password: '111111'
        })
        expect(user).to be_valid
      end
    end

    context '名前、メアド、パスワードが正しくなければ' do
      it  '無効となる事' do
        @user  = User.new ({
          name: "",
          email: "",
          password: ""
        })
        expect(@user.valid?).to be_falsy
      end
    end
  end
end
