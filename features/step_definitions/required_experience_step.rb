# Given:

# When:

When(/^I create a new offer with "(.*?)" as the title and "(.*?)" as required years of experience$/) do |title, required_experience|
  visit '/job_offers/new'
  fill_in('job_offer_form[title]', with: title)
  fill_in('job_offer_form[required_experience]', with: required_experience)
  click_button('Create')
end

# Then:

# And:

And(/^I should see "(.*?)" with "(.*?)" required years of experience in my offers list$/) do |title, required_experience| # rubocop:disable Layout/LineLength
  visit '/job_offers/my'
  page.should have_content(title)
  page.should have_content(required_experience)
end
