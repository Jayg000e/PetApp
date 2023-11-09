Given("I am on the createActivity page for pet {int}") do |petid|
    visit "/render/pets/#{petid}/activity"
  end


When("I fill in {string} with {string}") do |field, content|
    fill_in(field, with: content)
end

And("I click the {string} button") do |button_text|
    click_button(button_text)
end


And("I should be redirected back to the activity page for pet {int}") do |petid|
    expect(current_path).to eq("/render/pets/#{petid}/activities")
end
