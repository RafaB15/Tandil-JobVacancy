require 'spec_helper'

describe User do
  subject(:user) { described_class.new({}) }

  describe 'model' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:crypted_password) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:subscription_type) }
  end

  describe 'valid?' do
    it 'should be false when name is blank' do
      user = described_class.new(email: 'john.doe@someplace.com',
                                 crypted_password: 'a_secure_passWord!')
      expect(user.valid?).to eq false
      expect(user.errors).to have_key(:name)
    end

    it 'should be false when email is not valid' do
      user = described_class.new(name: 'John Doe', email: 'john',
                                 crypted_password: 'a_secure_passWord!')
      expect(user.valid?).to eq false
      expect(user.errors).to have_key(:email)
    end

    it 'should be false when password is blank' do
      user = described_class.new(name: 'John Doe', email: 'john')
      expect(user.valid?).to eq false
      expect(user.errors).to have_key(:crypted_password)
    end

    it 'should be true when all field are valid' do
      user = described_class.new(name: 'John Doe', email: 'john@doe.com',
                                 crypted_password: 'a_secure_passWord!')
      expect(user.valid?).to eq true
    end
  end

  describe 'create with subscription type' do
    let(:name) { 'John Doe' }
    let(:email) { 'john@doe.com' }
    let(:password) { 'password' }

    it 'User should have on-demand subscription type when created with on-demand subscription type' do
      subscription_type = SubscriptionOnDemand.new
      user = described_class.create(name, email, password, subscription_type)

      expect(user.subscription_type.class).to eq SubscriptionOnDemand
    end

    it 'User should have corporate subscription type when created with corporate subscription type' do
      subscription_type = SubscriptionCorporate.new
      user = described_class.create(name, email, password, subscription_type)

      expect(user.subscription_type.class).to eq SubscriptionCorporate
    end
  end

  describe 'has password?' do
    let(:password) { 'password' }
    let(:user) do
      described_class.new(password:,
                          email: 'john.doe@someplace.com',
                          name: 'john doe')
    end

    it 'should return false when password do not match' do
      expect(user).not_to have_password('invalid')
    end

    it 'should return true when password do  match' do
      expect(user).to have_password(password)
    end
  end
end
