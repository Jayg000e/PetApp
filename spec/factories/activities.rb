FactoryBot.define do
  factory :activity do
    content { Faker::Lorem.sentence }
    association :pet
  end
end
