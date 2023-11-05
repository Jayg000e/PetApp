# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create Users
user1 = User.create(username: 'user1', password: 'password1', email: 'user1@example.com', role: 'admin')
user2 = User.create(username: 'user2', password: 'password2', email: 'user2@example.com', role: 'user')
user3 = User.create(username: 'user3', password: 'password3', email: 'user3@example.com', role: 'user')
user4 = User.create(username: 'user4', password: 'password4', email: 'user4@example.com', role: 'user')
user5 = User.create(username: 'user5', password: 'password5', email: 'user5@example.com', role: 'admin')

# Create Pets
pet1 = Pet.create(name: 'Pet1', pet_type: 'Dog', breed: 'Golden Retriever', birthdate: Date.new(2020, 1, 15), onsale: true, price: 500.0, user: user1)
pet2 = Pet.create(name: 'Pet2', pet_type: 'Cat', breed: 'Siamese', birthdate: Date.new(2019, 5, 20), onsale: false, price: 0.0, user: user1)
pet3 = Pet.create(name: 'Pet3', pet_type: 'Dog', breed: 'Labrador', birthdate: Date.new(2021, 8, 10), onsale: true, price: 600.0, user: user1)
pet4 = Pet.create(name: 'Pet4', pet_type: 'Cat', breed: 'Persian', birthdate: Date.new(2020, 3, 5), onsale: false, price: 0.0, user: user2)
pet5 = Pet.create(name: 'Pet5', pet_type: 'Dog', breed: 'German Shepherd', birthdate: Date.new(2018, 11, 25), onsale: true, price: 700.0, user: user4)
pet6 = Pet.create(name: 'Pet6', pet_type: 'Cat', breed: 'Maine Coon', birthdate: Date.new(2019, 7, 10), onsale: false, price: 0.0, user: user4)
pet7 = Pet.create(name: 'Pet7', pet_type: 'Dog', breed: 'Bulldog', birthdate: Date.new(2022, 2, 8), onsale: true, price: 550.0, user: user4)
pet8 = Pet.create(name: 'Pet8', pet_type: 'Cat', breed: 'Ragdoll', birthdate: Date.new(2017, 9, 30), onsale: false, price: 0.0, user: user4)
pet9 = Pet.create(name: 'Pet9', pet_type: 'Dog', breed: 'Poodle', birthdate: Date.new(2019, 4, 12), onsale: true, price: 450.0, user: user5)
pet10 = Pet.create(name: 'Pet10', pet_type: 'Cat', breed: 'British Shorthair', birthdate: Date.new(2020, 6, 18), onsale: false, price: 0.0, user: user5)

# Create Activity
activity1 = Activity.create(content: 'Friendly activity', pet: pet1)
activity2 = Activity.create(content: 'Shy activity', pet: pet1)
activity3 = Activity.create(content: 'Energetic activity', pet: pet3)
activity4 = Activity.create(content: 'Calm activity', pet: pet5)
activity5 = Activity.create(content: 'Playful activity', pet: pet5)
activity6 = Activity.create(content: 'Timid activity', pet: pet5)
activity7 = Activity.create(content: 'Loyal activity', pet: pet7)
activity8 = Activity.create(content: 'Affectionate activity', pet: pet8)
activity9 = Activity.create(content: 'Intelligent activity', pet: pet9)
activity10 = Activity.create(content: 'Independent activity', pet: pet10)
