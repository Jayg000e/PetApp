# features/step_definitions/createPet_steps.rb
Given("I am on the createPet page") do
    visit '/render/users/pet'
end

Given /^I set the local storage item "([^"]*)" to "([^"]*)"$/ do |key, value|
    script = <<-JS
      localStorage.setItem(arguments[0], arguments[1]);
    JS
    driver.execute_script(script, key, value)
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

Then("I should see an alert with text {string}") do |expected_text|
    actual_text = page.accept_alert(wait: 10)
    expect(actual_text).to eq(expected_text)
end


And("I should be redirected back to the pet page") do
    expect(current_path).to eq('/render/users/pets')
end
