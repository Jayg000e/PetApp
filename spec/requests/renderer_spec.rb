require 'rails_helper'

RSpec.describe "Renderers", type: :request do
  describe "GET /allpets" do
    it "returns http success" do
      get "/renderer/allpets"
      expect(response).to have_http_status(:success)
    end
  end

end
