# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create Users
user1 = User.create(username: 'johndoe', password: 'johndoe', email: 'john@example.com', role: 'admin')
user2 = User.create(username: 'janedoe', password: 'janedoe', email: 'jane@example.com', role: 'user')
user3 = User.create(username: 'aliceblue', password: 'aliceblue', email: 'alice@example.com', role: 'user')
user4 = User.create(username: 'bobgreen', password: 'bobgreen', email: 'bob@example.com', role: 'user')
user5 = User.create(username: 'carolred', password: 'carolred', email: 'carol@example.com', role: 'admin')

# Create Pets with descriptions
pet1 = Pet.create(name: 'Buddy', pet_type: 'Dog', breed: 'Golden Retriever', birthdate: Date.new(2020, 1, 15), onsale: true, price: 500.0, user: user1, description: 'Buddy is a friendly Golden Retriever with a love for fetch and swimming.')
pet2 = Pet.create(name: 'Whiskers', pet_type: 'Cat', breed: 'Siamese', birthdate: Date.new(2019, 5, 20), onsale: false, price: 0.0, user: user1, description: 'Whiskers is a quiet Siamese, preferring sunbaths and serene environments.')
pet3 = Pet.create(name: 'Max', pet_type: 'Dog', breed: 'Labrador', birthdate: Date.new(2021, 8, 10), onsale: true, price: 600.0, user: user1, description: 'Max is an energetic Labrador who loves kids and is always ready for a game of catch.')
pet4 = Pet.create(name: 'Daisy', pet_type: 'Cat', breed: 'Persian', birthdate: Date.new(2020, 3, 5), onsale: false, price: 0.0, user: user2, description: 'Daisy is a fluffy Persian cat with a calm demeanor, perfect as a gentle companion.')
pet5 = Pet.create(name: 'Rex', pet_type: 'Dog', breed: 'German Shepherd', birthdate: Date.new(2018, 11, 25), onsale: true, price: 700.0, user: user4, description: 'Rex is a loyal German Shepherd, well-trained and protective, suitable for families.')
pet6 = Pet.create(name: 'Simba', pet_type: 'Cat', breed: 'Maine Coon', birthdate: Date.new(2019, 7, 10), onsale: false, price: 0.0, user: user4, description: 'Simba is a majestic Maine Coon, independent yet affectionate, with a regal presence.')
pet7 = Pet.create(name: 'Rocky', pet_type: 'Dog', breed: 'Bulldog', birthdate: Date.new(2022, 2, 8), onsale: true, price: 550.0, user: user4, description: 'Rocky the Bulldog is a couch potato who loves to snore and cuddle next to you.')
pet8 = Pet.create(name: 'Luna', pet_type: 'Cat', breed: 'Ragdoll', birthdate: Date.new(2017, 9, 30), onsale: false, price: 0.0, user: user4, description: 'Luna is a laid-back Ragdoll cat, with striking blue eyes, seeking a loving lap to lie on.')
pet9 = Pet.create(name: 'Coco', pet_type: 'Dog', breed: 'Poodle', birthdate: Date.new(2019, 4, 12), onsale: true, price: 450.0, user: user5, description: 'Coco is a poodle with a penchant for pampering, smart and perfect for allergy sufferers.')
pet10 = Pet.create(name: 'Oliver', pet_type: 'Cat', breed: 'British Shorthair', birthdate: Date.new(2020, 6, 18), onsale: false, price: 0.0, user: user5, description: 'Oliver is a British Shorthair, a true gentleman cat with a calm and composed character.')

# Create Activities with more descriptive content
activity1 = Activity.create(content: 'Buddy joined a local dog swim meet and took home the gold!', pet: pet1)
activity2 = Activity.create(content: 'Whiskers has perfected the art of silently judging from the windowsill.', pet: pet2)
activity3 = Activity.create(content: 'Max spent the day at the park making friends and chasing squirrels.', pet: pet3)
activity4 = Activity.create(content: 'Daisy was the star of the cat show, winning best in her breed.', pet: pet4)
activity5 = Activity.create(content: 'Rex helped out by participating in a local police K-9 demonstration.', pet: pet5)
activity6 = Activity.create(content: 'Simba entered a Maine Coon contest and charmed all the judges.', pet: pet6)
activity7 = Activity.create(content: 'Rocky spent a lazy Sunday snoring on the porch, enjoying the breeze.', pet: pet7)
activity8 = Activity.create(content: 'Luna got a new scratching post and has been busy "customizing" it all day.', pet: pet8)
activity9 = Activity.create(content: 'Coco attended a doggy day spa and came out looking fabulous.', pet: pet9)
activity10 = Activity.create(content: 'Oliver has discovered a love for catnip-filled toys, batting them around the house.', pet: pet10)
activity11 = Activity.create(content: 'Buddy attended a local dog meet-up and was a hit with his friendly demeanor.', pet: pet1)
activity12 = Activity.create(content: 'Whiskers has taken up a new hobby: birdwatching from the kitchen window.', pet: pet2)
activity13 = Activity.create(content: 'Max just completed his obedience training with flying colors.', pet: pet3)
activity14 = Activity.create(content: 'Daisy has been practicing her purring and is now a professional at making people smile.', pet: pet4)
activity15 = Activity.create(content: 'Rex helped to raise funds for a local animal shelter by participating in a charity run.', pet: pet5)
activity16 = Activity.create(content: 'Simba has learned to open doors and is exploring every cabinet he can find.', pet: pet6)
activity17 = Activity.create(content: 'Rocky just became a big brother to a litter of rescue kittens and is very protective of them.', pet: pet7)
activity18 = Activity.create(content: 'Luna managed to climb to the highest shelf and is now the queen of the mountain.', pet: pet8)
activity19 = Activity.create(content: 'Coco learned a new dance routine and is now the life of any party.', pet: pet9)
activity20 = Activity.create(content: 'Oliver was featured on a popular Instagram page for cats and has gained a small following.', pet: pet10)
