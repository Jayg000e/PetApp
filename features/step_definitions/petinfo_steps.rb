When("I click the {string} link") do |link_text|
    first(:link, link_text).click
  end
  
Then("I should be redirected to the pet information page") do
expect(current_path).to match("/render/pets/1") # Adjust the URL pattern as needed
end

Then("I should see an information card") do
expect(page).to have_css('.card') # Adjust the CSS class selector as needed
end

Then("I should see a button {string}") do |button_text|
expect(page).to have_button(button_text)
end