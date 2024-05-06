# When
# =========================================================

When('I create a new user {string} with a password {string}') do |email, password|
  visit '/register'
  fill_in('user[name]', with: email)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  fill_in('user[password_confirmation]', with: password)
  click_button('Create')
end

When('I create a new user with default subscription') do
  @user_email = 'pepito@gmail.com'

  visit '/register'
  fill_in('user[name]', with: 'pepito')
  fill_in('user[email]', with: @user_email)
  fill_in('user[subscription_type]', with: '')
  fill_in('user[password]', with: 'P4$$word')
  fill_in('user[password_confirmation]', with: 'P4$$word')
  click_button('Create')
end

# Then
# =========================================================

Then('I should see a user created confirmation message {string}') do |confirmation_message|
  page.should have_content(confirmation_message)
end

Then('I should see an error message {string}') do |error_message|
  page.should have_content(error_message)
end

Then('I should see {string} subscription in the users report') do |expected_subscription_type|
  visit 'reports/billing'
  @report_as_json = JSON.parse(page.body)

  subscription_type = nil

  @report_as_json['items'].each do |bill|
    subscription_type = bill['subscription'] if bill['user_email'] == @user_email
  end

  expect(subscription_type).to eq expected_subscription_type
end
