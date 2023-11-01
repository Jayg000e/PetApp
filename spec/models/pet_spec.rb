# spec/models/pet_spec.rb

require 'rails_helper'

# spec/models/pet_spec.rb
require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many activities with dependent: :destroy' do
      association = described_class.reflect_on_association(:activities)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end
end


# RSpec.describe Pet, type: :model do
#   describe 'validations' do
#     it 'is valid with valid attributes' do
#       pet = Pet.new(
#         name: 'Fido',
#         pet_type: 'Dog',
#         birthdate: Date.new(2019, 5, 10),
#         breed: 'Golden Retriever'
#       )
#       expect(pet).to be_valid
#     end
#   end
# end
