Given("there are pets with the following details:") do |table|
  # Iterate through the table rows and create pets with the specified details
  table.hashes.each do |pet_data|
    # Create a new pet with the data from the table
    Pet.create!(
      name: pet_data['Name'],
      pet_type: pet_data['Pet Type'],
      birthdate: Date.parse(pet_data['Birthdate']),
      breed: pet_data['Breed'],
      user: User.find_by(username: 'user1')
    )
  end
end

Given("there are users with the following details:") do |table|
  # Iterate through the table rows and create pets with the specified details
  table.hashes.each do |user|
    # Create a new pet with the data from the table
    User.create!(
      username: user['Username'],
      password: user['Password'],
      role: user['Role']
    )
  end
end

When("I visit the pet list page") do
  visit pets_path
end

Then("I should see the following pets:") do |table|
  # Iterate through the table rows and verify that each pet is displayed on the page
  table.hashes.each do |pet_data|
    expect(page).to have_content(pet_data['Name'])
    expect(page).to have_content(pet_data['Pet Type'])
    expect(page).to have_content(pet_data['Breed'])
  end
end
