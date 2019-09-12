require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:tweet1) { FactoryBot.create(:tweet, user: user)}
  let!(:tweet2) { FactoryBot.create(:tweet, user: user)}

  describe "GET #index" do
    it "redirects to login page for non logged in user" do
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end

    it "returns a success response" do
      sign_in user
      get :index
      expect(response).to be_successful
    end

    it "returns a success response" do
      sign_in user
      get :index
      expect(Tweet.all.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "redirects to login page for non logged in user" do
      get :show, params: {id: tweet1.id}
      expect(response).to redirect_to('/users/sign_in')
    end

    it "returns a success response" do
      sign_in user
      get :show, params: {id: tweet1.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "redirects to login page for non logged in user" do
      get :new
      expect(response).to redirect_to('/users/sign_in')
    end
    it "returns a success response" do
      sign_in user
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "redirects to login page for non logged in user" do
      get :edit, params: {id: tweet1.id}
      expect(response).to redirect_to('/users/sign_in')
    end
    it "returns a success response" do
      sign_in user
      get :edit, params: {id: tweet1.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tweet" do
        sign_in user
        valid_attributes = FactoryBot.attributes_for(:tweet, user: user)
        expect {
          post :create, params: {tweet: valid_attributes}
        }.to change(Tweet, :count).by(1)
      end

      it "redirects to the created tweet" do
        sign_in user
        valid_attributes = FactoryBot.attributes_for(:tweet, user: user)
        post :create, params: {tweet: valid_attributes}
        expect(response).to redirect_to(tweets_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        sign_in user
        invalid_attributes = { content: nil }
        post :create, params: {tweet: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested tweet" do
        sign_in user
        new_attributes = { content: "Hello World!!" }
        put :update, params: {id: tweet1.id, tweet: new_attributes}
        expect(Tweet.first.content).to eq("Hello World!!")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        sign_in user
        invalid_attributes = { content: nil }
        put :update, params: {id: tweet1.to_param, tweet: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tweet" do
      sign_in user
      tweet = FactoryBot.create(:tweet, user: user)
      expect {
        delete :destroy, params: {id: tweet.id}
      }.to change(Tweet, :count).by(-1)
    end
  end
end
