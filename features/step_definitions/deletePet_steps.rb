When('I click on the first {string} button') do |button_text|
    first(:button, button_text).click
    sleep(2)
end

When('I accept the alert') do
    page.driver.browser.switch_to.alert.accept
end
