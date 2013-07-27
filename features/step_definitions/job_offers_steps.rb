Given(/^I am logged in as job offerer$/) do
  user = User.create(:email => 'offerer@test.com',
									 :name => 'Offerer', 
									 :password => "Passw0rd!")
  visit '/login'
  fill_in('user[email]', :with => 'offerer@test.com')
  fill_in('user[password]', :with => 'Passw0rd!')
  click_button('Login')
  page.should have_content('offerer@test.com')
end

Given(/^I access the new offer page$/) do
  visit '/job_offers/new'
  page.should have_content('Title')
end

When(/^I fill the title with "(.*?)"$/) do |offer_title|
  fill_in('job_offer[title]', :with => offer_title)
end

When(/^confirm the new offer$/) do
  click_button('Create')
end