require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #register" do
    it "returns http success" do
      get :register
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #agency" do
    it "returns http success" do
      get :agency
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #logout" do
    it "returns http success" do
      get :logout
      expect(response).to have_http_status(:success)
    end
  end

end
