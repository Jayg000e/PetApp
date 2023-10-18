FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    password { Faker::Internet.password }
    role { ['admin', 'user'].sample } # Adjust roles if different in your app
  end
end
