require 'integration_spec_helper'

describe UserRepository do
  let(:repository) { described_class.new }
  let(:name) { 'Joe' }
  let(:email) { 'joe@doe.com' }
  let(:crypted_password) { 'SecureP4$$word' }
  let(:password) { 'SomePa$$w0rd' }

  it 'should find by email' do
    joe_user = User.new(name:, email:, crypted_password:)
    repository.save(joe_user)

    found_user = repository.find_by_email(joe_user.email)

    expect(found_user.email).to eq joe_user.email
    expect(found_user.id).to eq joe_user.id
  end

  it 'should retrieve all users' do
    initial_user_count = repository.all.size
    some_user = User.new(name:, email:, crypted_password:)
    repository.save(some_user)

    users = repository.all

    expect(users.size).to eq(initial_user_count + 1)
  end

  it 'should retrieve a user with professional subscription' do
    subscription = SubscriptionProfessional.new
    user = User.create(name, email, password, subscription)

    repository.save(user)

    user = repository.find_by_email(email)

    expect(user.subscription.class).to eq SubscriptionProfessional
  end
end
