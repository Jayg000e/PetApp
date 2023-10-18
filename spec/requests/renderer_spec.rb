require 'rails_helper'

RSpec.describe "Renderers", type: :request do
  describe "GET /render/pets" do
    it "returns http success" do
      get "/render/pets"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /render/pets/:id" do
    it "returns http success" do
      get "/render/pets/1"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /render/pets/:petid/activities" do
    it "returns http success" do
      get "/render/pets/1/activities"
      expect(response).to have_http_status(:success)
    end
  end

end
