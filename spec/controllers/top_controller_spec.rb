require 'rails_helper'

RSpec.describe TopController, type: :controller do

  describe "GET #index" do
    context '/リクエストがきた場合'
    before {get :index}

    it "トップページへレンダリングする事" do
      expect(response).to have_http_status(200)
    end

  end
end





