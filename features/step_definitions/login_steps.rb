Given('I am on the home page') do
  visit '/'
end

When('I click on the login link') do
  find('#loginLink').click
end

When('I fill in the login form with valid credentials') do
  fill_in 'username', with: 'user1'
  fill_in 'password', with: 'password1'
end

When('I fill in the login form with invalid credentials') do
  fill_in 'username', with: 'invalid_user'
  fill_in 'password', with: 'invalid_password'
end

When('I click the submit button') do
  within('#loginForm') do
    find('input[type="submit"]').click
  end
end

Then('I should be logged in successfully') do
  expect(page).to have_selector('#loggedInMessage')
end

Then('I should see an error message') do
  expect(page).to have_selector('.modal-content .error-msg')
end

Given('I have login') do
  visit '/'
  find('#loginLink').click
  fill_in 'username', with: 'user1'
  fill_in 'password', with: 'password1'
  within('#loginForm') do
    find('input[type="submit"]').click
  end
  sleep(1)
end
