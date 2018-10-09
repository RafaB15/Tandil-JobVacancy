require 'spec_helper'

describe User do
  subject(:user) { described_class.new }

  describe 'model' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:crypted_password) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:job_offers) }
  end

  describe 'valid?' do
    it 'should be false when name is blank' do
      user.email = 'john.doe@someplace.com'
      user.password = 'a_secure_passWord!'
      expect(user.valid?).to eq false
    end

    it 'should be false when email is not valid' do
      user.name = 'John Doe'
      user.email = 'john'
      user.password = 'a_secure_passWord!'
      expect(user.valid?).to eq false
    end

    it 'should be false when password is blank' do
      user.name = 'John Doe'
      user.email = 'john.doe@someplace.com'
      expect(user.valid?).to eq false
    end

    it 'should be true when all field are valid' do
      user.name = 'John Doe'
      user.email = 'john.doe@someplace.com'
      user.password = 'a_secure_passWord!'
      expect(user.valid?).to eq true
    end
  end

  describe 'authenticate' do
    let(:password) { 'password' }

    before :each do
      user.email = 'john.doe@someplace.com'
      user.password = password
    end

    it 'should return nil when password do not match' do
      email = user.email
      password = 'wrong_password'
      expect(described_class).to receive(:first).with(email: email).and_return(user)

      authentication_result = described_class.authenticate(email, password)

      expect(authentication_result).to be_nil
    end

    it 'should return nil when email do not match' do
      email = 'wrong@email.com'
      expect(described_class).to receive(:first).with(email: email).and_return(nil)

      authentication_result = described_class.authenticate(email, password)

      expect(authentication_result).to be_nil
    end

    it 'should return the user when email and password match' do
      email = user.email
      expect(described_class).to receive(:first).with(email: email).and_return(user)

      authentication_result = described_class.authenticate(email, password)

      expect(authentication_result).to eq user
    end
  end
end
