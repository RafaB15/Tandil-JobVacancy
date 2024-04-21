require 'spec_helper'

describe UserBiller do
  describe 'create_all_users_billing' do
    let(:user_email) { 'pepe@pepito.com' }

    it 'should return user email and 0.0 total to pay when user have no active offers' do
      user = instance_double('user', user_email:, amount_to_pay: 0, is_nil?: false)

      user_repo = instance_double('user_repo', find_by_email: user)
      offer_repo = instance_double('offer_repo', all_active: [])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq user_email
      expect(first_users_bill[:amount_to_pay]).to eq 0.0
    end

    it 'should return user email and 10.0 total to pay when user have 1 active offer' do
      user = instance_double('user', user_email:, amount_to_pay: 10, is_nil?: false)
      job_offer = instance_double('job_offer', owner: user)

      user_repo = instance_double('user_repo', find_by_email: user)

      offer_repo = instance_double('offer_repo', all_active: [job_offer])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq user_email
      expect(first_users_bill[:amount_to_pay]).to eq 10.0
    end

    it 'should return user email and 30.0 total to pay when user have 3 active offer and 2 inactive offers' do
      user = instance_double('user', user_email:, amount_to_pay: 30, is_nil?: false)
      job_offer = instance_double('job_offer', owner: user)

      user_repo = instance_double('user_repo', find_by_email: user)

      offer_repo = instance_double('offer_repo', all_active: [job_offer, job_offer, job_offer])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq user_email
      expect(first_users_bill[:amount_to_pay]).to eq 30.0
    end

    it 'should return user email and 80.0 total to pay when user with corporate subscription has 0 active offers' do
      user = instance_double('user', user_email:, amount_to_pay: 80, is_nil?: false)

      user_repo = instance_double('user_repo', find_by_email: user)

      offer_repo = instance_double('offer_repo', all_active: [])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq user_email
      expect(first_users_bill[:amount_to_pay]).to eq 80.0
    end
  end
end
