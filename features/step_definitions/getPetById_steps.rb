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


Then("I should see the pet details displayed in a card") do
  expect(page).to have_css('#my-container', wait: 15)
end


Then("I should see a list of questions about the pet's breed") do
  expect(page).to have_css('#questions div', minimum: 1, wait: 30)
end

# And("I should see a button with the text {string}") do |button_text|
#   wait = Selenium::WebDriver::Wait.new(timeout: 20)
#   button = wait.until { find_button(button_text, visible: false) }
#   expect(button).to be_visible
# end
Then(/I should see a button to "([^"]*)"/) do |button_text|
  wait = Selenium::WebDriver::Wait.new(timeout: 20)
  element = wait.until {page.has_button?(button_text)}
  expect(page).to have_button(button_text)
end


Then("I should see the answers to the generated questions") do
  expect(page).to have_css('#answers', minimum: 1)
end
