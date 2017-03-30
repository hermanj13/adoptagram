require 'rails_helper'

RSpec.describe MessageController, type: :controller do

  describe "GET #agency_index" do
    it "returns http success" do
      get :agency_index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #agency_show" do
    it "returns http success" do
      get :agency_show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #agency_reply" do
    it "returns http success" do
      get :agency_reply
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_index" do
    it "returns http success" do
      get :user_index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_create" do
    it "returns http success" do
      get :user_create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_show" do
    it "returns http success" do
      get :user_show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_reply" do
    it "returns http success" do
      get :user_reply
      expect(response).to have_http_status(:success)
    end
  end

end
