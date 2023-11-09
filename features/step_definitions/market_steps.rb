# When('I fill in {string} with {string}') do |label, preference|
#   fill_in label, with: preference
# end

When('I click on {string}') do |button_text|
  click_button button_text
end

Then('I should see a loading message') do
  expect(page).to have_content('Waiting for data, please be patient...')
end

Then('I should eventually see a pet suggestion from GPT in the container') do
  expect(page).to have_css('#my-container2', text: /\S+/,wait:60)
end


Given("I go to the market page") do
  visit('/render/market')
end

Given("there are pets onsale with the following details:") do |table|
  # Iterate through the table rows and create pets with the specified details
  table.hashes.each do |pet_data|
    # Create a new pet with the data from the table
    Pet.create!(
      name: pet_data['Name'],
      pet_type: pet_data['Pet Type'],
      birthdate: Date.parse(pet_data['Birthdate']),
      breed: pet_data['Breed'],
      onsale: pet_data['onSale']=="true",
      price: pet_data['Price'],
      user: User.find_by(username: 'user1')
    )
  end
end
