require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #mygroup" do
    it "returns http success" do
      get :mygroup
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_user" do
    it "returns http success" do
      get :add_user
      expect(response).to have_http_status(:success)
    end
  end

end
