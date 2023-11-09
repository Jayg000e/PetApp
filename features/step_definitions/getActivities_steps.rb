Given("there are activities with the following details:") do |table|
  # Iterate through the table rows and create pets with the specified details
  table.hashes.each do |activity_data|
    # Create a new pet with the data from the table
    Activity.create!(
      content: activity_data['Content'],
      pet: Pet.find_by(name: activity_data['Pet'])
    )
  end
end

When("I visit the activity page") do
  visit '/render/pets/1/activities'
end

Then("I should see the following activities:") do |table|
  # Iterate through the table rows and verify that each pet is displayed on the page
  table.hashes.each do |activity_data|
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    element = wait.until {page.has_content?(activity_data['Content'])}
    expect(page).to have_content(activity_data['Content'])
  end
end

Then ("I should see {string}")do |text|
  expect(page).to have_content(text)
end


Then('I should see the suggestions in the {string} container') do |container_id|
  # Wait for AJAX to complete and content to appear
  expect(page).to have_selector("##{container_id}",wait:60)

  # Get the container element
  container = find("##{container_id}")

  # Expect the container to have some text content
  expect(container).to have_text(/\S+/, wait: 60)
end
