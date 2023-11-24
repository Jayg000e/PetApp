require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
    
  describe 'GET #index' do
    it 'returns a success response' do
        get :index
        expect(response).to have_http_status(:ok) 
    end
  end

  describe 'GET #show' do 
    let(:activity) { create(:activity) }

    it 'returns the requested activity' do
      get :show, params: { id: activity.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(activity.id)
    end
  end 

  describe 'GET #by_pet' do
    let(:pet) { create(:pet) } 
    let!(:activities) { create_list(:activity, 2, pet: pet) }
 
    context 'when user has pets' do
        it 'returns pets of the user' do
            get :by_pet, params: { petid: pet.id }
            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    context 'when user has no pets' do
    it 'returns a not found response for a pet with no activities' do
        pet_id = 99999999
        get :by_pet, params: { petid: pet_id }
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)["error"]).to eq("No activities found for pet with ID #{pet_id}")
        end
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
        let(:pet) { create(:pet) }
        let(:valid_params) { attributes_for(:activity, pet_id: pet.id) }

        it 'creates a new activity' do
        expect {
            post :create, params: { activity: valid_params }
        }.to change(Activity, :count).by(1)
        expect(response).to have_http_status(:created)
        end
    end

    context 'with invalid parameters' do
        let(:invalid_params) { attributes_for(:activity, name: nil) } # Generates invalid pet attributes

        it 'does not create an activity and returns an error' do
          expect {
            post :create, params: { activity: invalid_params }
          }.not_to change(Activity, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end
    end
  end

  describe 'DELETE #destroy' do
    let!(:activity) { create(:activity) }

    it 'destroys the activity' do
      expect {
        delete :destroy, params: { id: activity.id }
      }.to change(Activity, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end

end