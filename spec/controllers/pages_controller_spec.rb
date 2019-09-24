require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #explore" do
    it "returns http success" do
      get :explore
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #notifications" do
    it "returns http success" do
      get :notifications
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #messages" do
    it "returns http success" do
      get :messages
      expect(response).to have_http_status(:success)
    end
  end

end
