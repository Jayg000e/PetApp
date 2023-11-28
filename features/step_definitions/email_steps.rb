Then('I should see a contact button with email address {string}') do |email_text|
    buttons = all('button[data-email]')
    button_email = buttons.first.native.attribute('data-email') 
    expect(button_email).to eq(email_text)
  end