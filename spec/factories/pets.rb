FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }
    pet_type { ["Dog", "Cat"].sample }
    birthdate { Faker::Date.birthday }
    breed { Faker::Creature::Dog.breed }
    onsale { [true, false].sample }
    price { Faker::Number.decimal(l_digits: 2) }
    association :user
  end
end
