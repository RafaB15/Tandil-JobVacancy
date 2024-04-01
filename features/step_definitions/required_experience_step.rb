OFFER_ACTIVATED_MESSAGE = 'Offer activated'.freeze
REQUIRED_EXPERIENCE_ERROR_MESSAGE = 'invalid'.freeze

# Given:

Given(/^I have a offer with "(.*?)" as title and "(.*?)" as required years of experience in my offers list$/) do |title, required_experience|
  JobOfferRepository.new.delete_all

  visit '/job_offers/new'
  fill_in('job_offer_form[title]', with: title)
  fill_in('job_offer_form[required_experience]', with: required_experience)
  click_button('Create')
end

# When:

When(/^I create a new offer with "(.*?)" as the title and "(.*?)" as required years of experience$/) do |title, required_experience|
  visit '/job_offers/new'
  fill_in('job_offer_form[title]', with: title)
  fill_in('job_offer_form[required_experience]', with: required_experience)
  click_button('Create')
end

When(/^I activate the job offer$/) do
  visit '/job_offers/my'
  click_button('Activate')
end

When(/^I change nothing and save$/) do
  click_link('Edit')
  click_button('Save')
end

When(/^I change the required years of experience to "(.*?)"$/) do |required_experience|
  click_link('Edit')
  fill_in('job_offer_form[required_experience]', with: required_experience)
  click_button('Save')
end

# Then:

Then(/^I should see a offer activated confirmation message$/) do
  page.should have_content(OFFER_ACTIVATED_MESSAGE)
end

Then(/^I should see an error message$/) do
  page.should have_content(REQUIRED_EXPERIENCE_ERROR_MESSAGE)
end

# And:

And(/^I should see "(.*?)" with "(.*?)" required years of experience in my offers list$/) do |title, required_experience| # rubocop:disable Layout/LineLength
  visit '/job_offers/my'
  page.should have_content(title)
  page.should have_content(required_experience)
end

And(/^I should see "(.*?)" with "(.*?)" required years of experience in the job offers tab$/) do |title, required_experience| # rubocop:disable Layout/LineLength
  visit '/job_offers/latest'
  page.should have_content(title)
  page.should have_content(required_experience)
end
