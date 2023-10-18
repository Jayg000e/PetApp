require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe 'GET #index' do
    let!(:pets) { create_list(:pet, 3) } # Creates 3 pets

    it 'returns all pets' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET #show' do
    let(:pet) { create(:pet) }

    it 'returns the requested pet' do
      get :show, params: { id: pet.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(pet.id)
    end
  end

  describe 'GET #by_user' do
    let(:user) { create(:user) }
    let!(:pets) { create_list(:pet, 2, user: user) }

    context 'when user has pets' do
      it 'returns pets of the user' do
        get :by_user, params: { userid: user.id }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end

    context 'when user has no pets' do
      it 'returns an error' do
        get :by_user, params: { userid: 999 } # A non-existent user ID
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)["error"]).to eq("No pets found for user with ID 999")
      end
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:user) { create(:user) }
      let(:valid_params) { attributes_for(:pet, user_id: user.id) }

      it 'creates a new pet' do
        expect {
          post :create, params: { pet: valid_params }
        }.to change(Pet, :count).by(1)
        expect(response).to have_http_status(:created)
      end

    end

    context 'with invalid parameters' do
      let(:invalid_params) { attributes_for(:pet, name: nil) } # Generates invalid pet attributes

      it 'does not create a pet and returns an error' do
        expect {
          post :create, params: { pet: invalid_params }
        }.not_to change(Pet, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
