require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "GET #toggle" do
    it "returns http success" do
      get :toggle
      expect(response).to have_http_status(:success)
    end
  end

end
