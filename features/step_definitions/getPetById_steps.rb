Given("I am on the AJAX pet page") do
  visit('/render/pets/1') # Load AJAX pet page for pet with ID 1
end

Given('the pet details are loaded for pet with ID {string}') do |pet_id|
  visit("/render/pets/#{pet_id}")
  expect(page).to have_css('#my-container', wait: 15)
end

When("I load the pet details for pet with ID {string}") do |id|
  visit("/render/pets/#{id}")
end

When("I click the {string} button and wait") do |button_text|
  click_button(button_text)
  # Wait for the #loadingMessage to disappear
  expect(page).to have_css('#loadingMessage', wait: 15)
  expect(page).to have_no_css('#loadingMessage', wait: 15)

  # Wait for at least one div inside #questions to appear
  expect(page).to have_css('#questions', minimum: 1, wait: 15)
end


Then("I should see the pet details displayed in a card") do
  expect(page).to have_css('#my-container', wait: 15)
end


Then("I should see a list of questions about the pet's breed") do
  expect(page).to have_css('#questions', minimum: 1, wait: 30)
end

And("I should see a button to {string}") do |button_text|
  expect(page).to have_button(button_text, wait: 30)
end

Then("I should see the answers to the generated questions") do
  expect(page).to have_css('#answers', minimum: 1)
end
