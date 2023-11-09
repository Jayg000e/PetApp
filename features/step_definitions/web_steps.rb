# features/step_definitions/web_steps.rb
require 'selenium-webdriver'

# Given(/^I am on the getPetById page$/) do
#   visit 'render/pets/1' # Adjust the path and parameter as needed
# end

# When(/^I click the "Generate" button$/) do
#   click_button 'generateButton' # Replace with the actual button ID or text
# end

# #Then(/^I should see "Waiting for data, please be patient..."$/) do
# #  expect(page).to have_content('Waiting for data, please be patient...')
# #end

# Then(/^I should see "(.*?)"$/) do |text|
#   wait = Selenium::WebDriver::Wait.new(timeout: 10)
#   element = wait.until {page.has_content?(text)}
#   expect(page).to have_content(text)
#   #page.find(text)
# end

# Then(/^I should see a button with text "(.*?)"$/) do |button_text|
#   expect(page).to have_button(button_text)
# end
