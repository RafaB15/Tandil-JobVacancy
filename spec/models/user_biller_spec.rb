require 'spec_helper'

describe UserBiller do
  describe 'create_all_users_billing' do
    let(:email) { 'pepe@pepito.com' }
    let(:another_email) { 'maria@maria.com' }

    it 'should return user email and 0.0 total to pay when user have no active offers' do
      user = instance_double('user', email:, amount_to_pay: 0)

      user_repo = instance_double('user_repo', all: [user])
      offer_repo = instance_double('offer_repo', find_actives_by_owner: [])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq email
      expect(first_users_bill[:amount_to_pay]).to eq 0.0
    end

    it 'should return user email and 10.0 total to pay when user have 1 active offer' do
      user = instance_double('user', email:, amount_to_pay: 10)
      job_offer = instance_double('job_offer', owner: user)

      user_repo = instance_double('user_repo', all: [user])

      offer_repo = instance_double('offer_repo', find_actives_by_owner: [job_offer])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq email
      expect(first_users_bill[:amount_to_pay]).to eq 10.0
    end

    it 'should return user email and 30.0 total to pay when user have 3 active offer and 2 inactive offers' do
      user = instance_double('user', email:, amount_to_pay: 30)
      job_offer = instance_double('job_offer', owner: user)

      user_repo = instance_double('user_repo', all: [user])

      offer_repo = instance_double('offer_repo', find_actives_by_owner: [job_offer, job_offer, job_offer])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq email
      expect(first_users_bill[:amount_to_pay]).to eq 30.0
    end

    it 'should return user email and 80.0 total to pay when user with corporate subscription has 0 active offers' do
      user = instance_double('user', email:, amount_to_pay: 80)

      user_repo = instance_double('user_repo', all: [user])

      offer_repo = instance_double('offer_repo', find_actives_by_owner: [])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq email
      expect(first_users_bill[:amount_to_pay]).to eq 80.0
    end

    it 'should return second user email and 80.0 amount to pay when user has corporate and 0 active offers' do
      user = instance_double('user', email:, amount_to_pay: 80)
      another_user = instance_double('another_user', email: another_email, amount_to_pay: 80)

      user_repo = instance_double('user_repo', all: [user, another_user])
      offer_repo = instance_double('offer_repo', find_actives_by_owner: [])

      users_biller = described_class.new(user_repo, offer_repo)
      second_users_bill = users_biller.create_all_users_billing[1]
      expect(second_users_bill[:user_email]).to eq another_email
      expect(second_users_bill[:amount_to_pay]).to eq 80.0
    end
  end
end
