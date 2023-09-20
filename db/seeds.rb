# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create Pets
pets = [
  { name: 'Fido', pet_type: 'Dog', birthdate: Date.new(2019, 5, 10), breed: 'Golden Retriever' },
  { name: 'Whiskers', pet_type: 'Cat', birthdate: Date.new(2020, 2, 15), breed: 'Siamese' },
  { name: 'Buddy', pet_type: 'Dog', birthdate: Date.new(2018, 8, 20), breed: 'Labrador Retriever' },
  { name: 'Mittens', pet_type: 'Cat', birthdate: Date.new(2019, 12, 5), breed: 'Persian' },
  { name: 'Spot', pet_type: 'Dog', birthdate: Date.new(2021, 3, 8), breed: 'Dalmatian' },
]

pets.each do |pet_data|
  Pet.create(pet_data)
end

pets.each do |pet_data|
  Pet.create(pet_data)
end
