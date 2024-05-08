USER_NAME = 'pepito'.freeze
PASSWORD = 'P4$$word'.freeze

Given('I create a new user {string} with the email {string} and age {string}') do |name, email, age|
  @email = email

  visit '/register'
  fill_in('user[name]', with: name)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: PASSWORD)
  fill_in('user[password_confirmation]', with: PASSWORD)
  fill_in('user[age]', with: age)
  click_button('Create')
end

# When
# =========================================================

When('I create a new user {string} with a password {string}') do |email, password|
  visit '/register'
  fill_in('user[name]', with: email)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  fill_in('user[password_confirmation]', with: password)
  fill_in('user[age]', with: '20')
  click_button('Create')
end

When('I create a new user with default subscription') do
  @user_email = 'pepito@gmail.com'

  visit '/register'
  fill_in('user[name]', with: USER_NAME)
  fill_in('user[email]', with: @user_email)
  select('', from: 'user[subscription_type]')
  fill_in('user[password]', with: PASSWORD)
  fill_in('user[password_confirmation]', with: PASSWORD)
  fill_in('user[age]', with: '20')
  click_button('Create')
end

When('I create a new user with {string} subscription') do |subscription_type|
  @user_email = 'pepito@gmail.com'

  visit '/register'
  fill_in('user[name]', with: USER_NAME)
  fill_in('user[email]', with: @user_email)
  select(subscription_type, from: 'user[subscription_type]')
  fill_in('user[password]', with: PASSWORD)
  fill_in('user[password_confirmation]', with: PASSWORD)
  fill_in('user[age]', with: '20')
  click_button('Create')

  @user = UserRepository.new.find_by_email(@user_email)
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
