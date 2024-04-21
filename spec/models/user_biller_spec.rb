require 'spec_helper'

describe UserBiller do
  describe 'create_all_users_billing' do
    let(:user_email) { 'pepe@pepito.com' }

    it 'should return user email and 0.0 total to pay when user have no active offers' do
      user = instance_double('user', user_email:)

      user_repo = instance_double('user_repo', all: [user])
      offer_repo = instance_double('offer_repo', all_active: [])

      users_biller = described_class.new(user_repo, offer_repo)
      first_users_bill = users_biller.create_all_users_billing[0]
      expect(first_users_bill[:user_email]).to eq user_email
      expect(first_users_bill[:amount_to_pay]).to eq 0.0
    end
  end
end
