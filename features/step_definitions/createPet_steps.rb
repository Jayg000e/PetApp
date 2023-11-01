# features/step_definitions/createPet_steps.rb
Given("I am on the createPet page") do   
    visit '/render/users/pet'
end


# When("I fill in {string} with {string}") do |field, value|
#     fill_in field, with: value
# end
  
And("I check {string}") do |field|
    check(field)
end
  
# And("I click the {string} button") do |button_text|
#     click_button(button_text)
# end

# Then("I should see an alert with text {string}") do |expected_text|
#     wait = Selenium::WebDriver::Wait.new(timeout: 10)
#     element = wait.until {page.has_content?(text)}
#     expect(page).to have_content(text)
# end
  
  
And("I should be redirected back to the pet page") do
    expect(current_path).to eq('/render/users/pet')
end
  