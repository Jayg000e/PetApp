require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe "GET #index" do
    it "returns a JSON response with a list of pets" do
      # Create test data by manually creating Pet records
      pet1 = Pet.create(name: "Dextero", pet_type: "Dog", birthdate: "2019-05-10", breed: "Golden Retriever")
      # Add more pet records as needed

      # Send a GET request to the index action
      get :index, format: :json

      # Expect a successful response (HTTP status 200)
      expect(response).to have_http_status(:success)

      # Parse the JSON response
      json_response = JSON.parse(response.body)

      # Convert the birthdate attribute in the expected hash to a string
      expected_birthdate = pet1.birthdate.strftime("%Y-%m-%d")

      # Modify the expectation to use the string representation of birthdate
      # Modify the expectation to access the first element of the json_response array
      expect(json_response.first).to include(
        {
          "id" => pet1.id,
          "name" => pet1.name,
          "pet_type" => pet1.pet_type,
          "birthdate" => expected_birthdate,  # Use the string representation
          "breed" => pet1.breed,
        }
        # Add similar hashes for other pet records
        # Add other attributes as needed
      )

    end
  end
end
