require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #index" do
        it "returns a success response" do
            get :index
            expect(response).to be_successful
        end
    end


    describe "GET #show" do
        it "returns a success response" do
            user = User.create(username: "testuser", password: "password", role: "user")
            get :show, params: { id: user.id }
            expect(response).to be_successful
        end
    end


    describe "POST #create" do
        context "with valid user information" do
            it "creates a new user" do
                expect {
                    post :create, params: { user: { username: "newuser", password: "password", role: "user" } }
                }.to change(User, :count).by(1)

                expect(response).to have_http_status(:created)
                expect(flash[:notice]).to eq('User Successfully Created!')
                json_response = JSON.parse(response.body)
                expect(json_response['user']['username']).to eq('newuser')
                expect(json_response['message']).to eq('User Successfully Created!')
            end
        end

        context "with missing user information" do
            it "returns an unprocessable entity status" do
                post :create, params: { user: { username: "", password: "" } }

                expect(response).to have_http_status(:unprocessable_entity)
                expect(flash.now[:error]).to eq('Please enter valid username and password.')
                json_response = JSON.parse(response.body)
                expect(json_response['error']).to include('Please enter valid username and password.')
            end
        end

        context "with a duplicate username" do
            it "returns an unprocessable entity status" do
                user = User.create(username: "existinguser", password: "password", role: "user")
                post :create, params: { user: { username: "existinguser", password: "newpassword", role: "user" } }

                expect(response).to have_http_status(:unprocessable_entity)
                expect(flash.now[:error]).to eq("Username has already been taken")
                json_response = JSON.parse(response.body)
                expect(json_response['error']).to eq("Username has already been taken")
            end
        end

        context 'when user information is invalid' do
            it 'returns an error response' do
                user_params = { username: 'new_user', password: nil } # Password is too short
      
                post :create, params: { user: user_params }, format: :json
      
                expect(response).to have_http_status(:unprocessable_entity)
                expect(JSON.parse(response.body)).to include(
                    'error' => a_kind_of(String) # You can specify the exact error message here if needed
                )
            end
        end
    end

    let(:valid_attributes) { { username: 'testuser', password: 'password', role: 'user' } }
    let(:user) { User.create(valid_attributes) }
    describe "PATCH #update" do
        context "with valid user information" do
            it "updates the user and returns a JSON response with HTTP status :ok" do
                new_password = 'newuser'
                patch :update, params: { id: user.id, user: { password: new_password } }
                expect(response).to have_http_status(:ok)

                user.reload
                expect(user.password).to eq(new_password)

                json_response = JSON.parse(response.body)
                expect(json_response['user']['password']).to eq(new_password)
                expect(json_response['message']).to eq('Password was successfully updated')
            end
        end
    end


    describe "DELETE #destroy" do
        let!(:user) { User.create(username: "user_to_delete", password: "password", role: "user") }

        it "deletes the user" do
            expect {
                delete :destroy, params: { id: user.id }
            }.to change(User, :count).by(-1)
        end

        it "redirects to users_url" do
            delete :destroy, params: { id: user.id }
            expect(response).to redirect_to(users_url)
        end

        it "sets a notice" do
            delete :destroy, params: { id: user.id }
            expect(flash[:notice]).to eq('User was successfully deleted.')
        end
    end

    describe '#login' do
        it 'logs in a user with valid credentials' do
            user = create(:user, username: 'valid_user', password: 'password123') # Create a user with FactoryBot or similar
    
            post :login, body: { username: 'valid_user', password: 'password123' }.to_json, as: :json
    
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)).to include(
                'token' => a_kind_of(String),
                'success' => true,
                'message' => 'Logged in successfully'
            )
        end
    
        it 'returns an error with invalid credentials' do
            post :login, body: { username: 'non_existent_user', password: 'invalid_password' }.to_json, as: :json
    
            expect(response).to have_http_status(:unauthorized)
            expect(JSON.parse(response.body)).to include(
                'success' => false,
                'error' => 'Invalid username or password'
            )
        end
    end
end
