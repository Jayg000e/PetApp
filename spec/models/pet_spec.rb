# spec/models/pet_spec.rb

require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      pet = Pet.new(
        name: 'Fido',
        pet_type: 'Dog',
        birthdate: Date.new(2019, 5, 10),
        breed: 'Golden Retriever'
      )
      expect(pet).to be_valid
    end
  end
end
