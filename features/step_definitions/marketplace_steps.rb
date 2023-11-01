Given("I am on the home page") do
    visit('/render/pets')
  end
  
Then("I should see a navigation bar") do
  expect(page).to have_css('.navbar')
end

Then("the navigation bar should contain the {string} list item") do |list_item_text|
  expect(page).to have_css('.navbar li', text: list_item_text)
end

#Then("I should see a table of pets") do
#  expect(page).to have_css('.table-pets') # Assuming a CSS class "table-pets" for the table of pets
#end

