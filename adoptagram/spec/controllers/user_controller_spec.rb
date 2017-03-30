require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #dashboard" do
    it "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create_contact" do
    it "returns http success" do
      get :create_contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create_Family" do
    it "returns http success" do
      get :create_Family
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create_pet" do
    it "returns http success" do
      get :create_pet
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create_vet" do
    it "returns http success" do
      get :create_vet
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_contact" do
    it "returns http success" do
      get :update_contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_family" do
    it "returns http success" do
      get :update_family
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_pet" do
    it "returns http success" do
      get :update_pet
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_vet" do
    it "returns http success" do
      get :update_vet
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
