Given(/^only a "(.*?)" offer exists in the offers list$/) do |job_title|
  JobOfferRepository.new.delete_all

  @job_offer = JobOffer.new(title: job_title, location: 'a nice job', description: 'a nice job')
  @job_offer.owner = UserRepository.new.first
  @job_offer.is_active = true

  JobOfferRepository.new.save @job_offer
end

Given(/^I access the offers list page$/) do
  visit '/job_offers'
end

When(/^I apply$/) do
  click_link 'Apply'
  fill_in('job_application_form[applicant_email]', with: 'applicant@test.com')
  click_button('Apply')
end

Then(/^I should receive a mail with offerer info$/) do
  mail_store = "#{Padrino.root}/tmp/emails"
  file = File.open("#{mail_store}/applicant@test.com", 'r')
  content = file.read
  content.include?(@job_offer.title).should be true
  content.include?(@job_offer.location).should be true
  content.include?(@job_offer.description).should be true
  content.include?(@job_offer.owner.email).should be true
  content.include?(@job_offer.owner.name).should be true
end

When('I apply to a job offer with my email {string} and my CV link {string}') do |email, cv_link|
  click_link 'Apply'
  fill_in('job_application_form[applicant_email]', with: email)
  fill_in('job_application_form[cv_link]', with: cv_link)
  click_button('Apply')
end

Then('I should see a applied to job offer confirmation message {string}') do |confirmation_message|
  page.should have_content(confirmation_message)
end

Given('I apply to a job offer with my email {string} and my description {string}') do |email, description|
  click_link 'Apply'
  fill_in('job_application_form[applicant_email]', with: email)
  fill_in('job_application_form[description]', with: description)
  click_button('Apply')
end
