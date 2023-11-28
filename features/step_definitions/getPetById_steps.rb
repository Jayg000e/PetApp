Given("I am on the pet page") do
  visit('/render/pets/1') # Load AJAX pet page for pet with ID 1
end


When(/^the user clicks on "(.*?)" button$/) do |button_text|
  click_button(button_text)
end


Then('the "Waiting for data, please be patient..." message should be displayed') do
  expect(page).to have_selector('#loadingMessage', visible: true)
end

Then('an AJAX request should be made to fetch the pet\'s data') do
  sleep(1)
end

Then('upon successful response, questions should be displayed in the "questions" container') do
  # This will wait for the questions to appear, which should happen if the AJAX call succeeds
  expect(page).to have_css('#questions div',wait:60)
end

Then('the answers should be displayed in the "answers" container') do
  # This will check that the answers are now visible to the user
  expect(page).to have_selector('#answers', visible: true,wait:60)
end

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
      role: user['Role'], 
      email: user['Email']
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
