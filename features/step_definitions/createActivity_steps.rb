# features/step_definitions/createActivity_steps.rb
Given("I am on the createActivity page") do   
    visit '/render/pets/1/activity'
end

When("I fill in {string} with {string}") do |field, content|
    fill_in(field, with: content)
end
  
And("I click the {string} button") do |button_text|
    click_button(button_text)
end

Then("I should see an alert with text {string}") do |expected_text|
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    element = wait.until {page.has_content?(text)}
    expect(page).to have_content(text)
end
  
  
And("I should be redirected back to the activity page") do
    expect(current_path).to eq('/render/pets/1/activity')
end
  
