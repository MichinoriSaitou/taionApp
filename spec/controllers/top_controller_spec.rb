require 'rails_helper'

RSpec.describe TopController, type: :controller do

  describe "GET #index" do
    context '/へレスポンスがきた場合'
    before {get :index}

    it "トップページへレンダリングする事" do
      expect(response).to have_http_status(:index)
    end

  end
end





