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

  describe 'Renderer Routing', type: :routing do
    it 'routes GET /render/users/pet to renderer#createPet' do
      expect(get: '/render/users/pet').to route_to('renderer#createPet')
    end
  end

  describe "GET /render/pets/:petid/activity" do
    it "returns http success" do
      get "/render/pets/:petid/activity"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /render/users/pets" do
    it "returns http success" do
      get "/render/users/pets"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #createPet' do
    it 'renders the createPet view' do
      get '/render/users/pet' 
      expect(response).to render_template('createPet')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #market' do
    it 'assigns the API key and renders the market view' do
      get '/render/market'
      expect(response).to render_template('market')
      expect(assigns(:apiKey)).to eq(Rails.application.credentials[:api_key])
      expect(response).to have_http_status(:success)
    end
  end
end
