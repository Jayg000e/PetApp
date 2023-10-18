# spec/models/activity_spec.rb

require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'associations' do
    it { should belong_to(:pet) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }  # Example validation, modify as needed
    it { should validate_numericality_of(:duration).is_greater_than(0) }  # Example validation, modify as needed
  end
end
