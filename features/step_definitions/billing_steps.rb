require 'json'
ON_DEMAND_SUBSCRIPTION = 'on-demand'.freeze
CORPORATE_SUBSCRIPTION = 'corporate'.freeze
PROFESSIONAL_SUBSCRIPTION = 'professional'.freeze

ANOTHER_USER_EMAIL = 'another@email.com'.freeze
SOME_PASSWORD = 'somePassword!'.freeze

def create_subscription_with(subscription_type)
  case subscription_type
  when ON_DEMAND_SUBSCRIPTION
    SubscriptionOnDemand.new
  when CORPORATE_SUBSCRIPTION
    SubscriptionCorporate.new
  when PROFESSIONAL_SUBSCRIPTION
    SubscriptionProfessional.new
  else
    expect(true).to eq false # raise error, no known subscription
  end
end

# Given
# =========================================================s

Given('a user {string} with {string} subscription') do |user_email, subscription_type|
  subscription = create_subscription_with(subscription_type)

  @user = User.create(user_email, user_email, SOME_PASSWORD, subscription)

  UserRepository.new.save(@user)
end

Given('there are no users') do
  UserRepository.new.delete_all
end

Given('there are no offers at all') do
  JobOfferRepository.new.delete_all
end

Given('{int} active offers') do |offer_count|
  repository = JobOfferRepository.new

  (0...offer_count).each do |counter|
    job_offer = JobOffer.new(title: "active offer number #{counter}", user_id: @user.id, is_active: true)

    repository.save(job_offer)
  end
end

Given('another user {string} with {string} subscription') do |user_email, subscription_type|
  subscription = create_subscription_with(subscription_type)

  @user = User.create(user_email, user_email, SOME_PASSWORD, subscription)

  UserRepository.new.save(@user)
end

Given('the user {string} has {int} active offers') do |user_email, active_offer_count|
  repository = JobOfferRepository.new
  user = UserRepository.new.find_by_email(user_email)

  if active_offer_count == 1
    job_offer = JobOffer.new(title: 'test 1 active offer', user_id: user.id, is_active: true)

    repository.save(job_offer)
  end
end

Given('{int} inactive offers') do |inactive_offer_count|
  repository = JobOfferRepository.new

  (0...inactive_offer_count).each do |counter|
    job_offer = JobOffer.new(title: "inactive offer number #{counter}", user_id: @user.id, is_active: false)

    repository.save(job_offer)
  end
end

Given('the user {string}') do |user_email|
  @user = UserRepository.new.find_by_email(user_email)
end

Given('another user with {string} subscription') do |subscription_type|
  subscription = create_subscription_with(subscription_type)

  @user = User.create(ANOTHER_USER_EMAIL, ANOTHER_USER_EMAIL, SOME_PASSWORD, subscription)

  UserRepository.new.save(@user)
end

# When
# =========================================================

When('I get the billing report') do
  visit 'reports/billing'
  @report_as_json = JSON.parse(page.body)
end

# Then
# =========================================================

Then('the total active offers is {int}') do |expected_active_offers|
  expect(@report_as_json['total_active_offers']).to eq expected_active_offers
end

Then('the total amount is {float}') do |expected_total_amount|
  expect(@report_as_json['total_amount']).to eq expected_total_amount
end

Then('the amount to pay for the user {string} is {float}') do |user_email, expected_amount|
  amount_to_pay = nil

  @report_as_json['items'].each do |bill|
    amount_to_pay = bill['amount_to_pay'] if bill['user_email'] == user_email
  end

  expect(amount_to_pay).to eq expected_amount
end

Then('the subscription for the user {string} is {string}') do |user_email, subscription_type|
  subscription = nil

  @report_as_json['items'].each do |bill|
    subscription = bill['subscription'] if bill['user_email'] == user_email
  end

  expect(subscription).to eq subscription_type
end

Then('the active offers count for the user {string} is {int}') do |user_email, expected_active_offers|
  active_offers_count = nil

  @report_as_json['items'].each do |bill|
    active_offers_count = bill['active_offers_count'] if bill['user_email'] == user_email
  end

  expect(active_offers_count).to eq expected_active_offers
end

Then('the total active offers are {int}') do |expected_active_offers|
  expect(@report_as_json['total_active_offers']).to eq expected_active_offers
end

Then('the billing for this user is {float}') do |expected_amount|
  amount_to_pay = nil

  @report_as_json['items'].each do |bill|
    amount_to_pay = bill['amount_to_pay'] if bill['user_email'] == @user.email
  end

  expect(amount_to_pay).to eq expected_amount
end
