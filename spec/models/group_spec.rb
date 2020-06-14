require 'rails_helper'

RSpec.describe Group, type: :model do
  describe '#validates'  do
    context 'グループ名があれば' do
      it '有効である事'  do
        name = Group.new({
            name: 'テスト'
        })
        expect(name).to be_valid
      end
    end

    context '名前、メアド、パスワードが正しくなければ' do
      it  '無効となる事' do
        name = Group.new({
            name: ''
        })
        expect(name).to_not be_falsy
      end
    end
  end
end

