When('I create a new user {string} with a password {string}') do |email, password|
  visit '/register'
  fill_in('user[name]', with: email)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  fill_in('user[password_confirmation]', with: password)
  click_button('Create')
end

Then('I should see a user created confirmation message {string}') do |confirmation_message|
  page.should have_content(confirmation_message)
end

Then('I should see an error message {string}') do |error_message|
  page.should have_content(error_message)
end
