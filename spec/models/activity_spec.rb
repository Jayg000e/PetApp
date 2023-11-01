# spec/models/activity_spec.rb

require 'rails_helper'

RSpec.describe Activity, type: :model do
  it 'belongs to a pet' do
    association = described_class.reflect_on_association(:pet)
    expect(association.macro).to eq :belongs_to
  end
end
