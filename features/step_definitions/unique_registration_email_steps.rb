PASSWORD = 'PassW0rd!'.freeze

Given('I create a new user {string} with the email {string}') do |user_name, user_email|
  @email = user_email

  visit '/register'
  fill_in('user[name]', with: user_name)
  fill_in('user[email]', with: user_email)
  fill_in('user[password]', with: PASSWORD)
  fill_in('user[password_confirmation]', with: PASSWORD)
  click_button('Create')
end

Given('The email was never used to create another account') do
  repo = UserRepository.new.find_by_email(@email)

  expect(repo).to eq nil
end

Then('I should log in with my new user account') do
  visit '/login'
  fill_in('user[email]', with: @email)
  fill_in('user[password]', with: PASSWORD)
  click_button('Login')
  page.should have_content(@email)
end
