require 'spec_helper'

describe UserBiller do
  describe 'create_all_users_billing' do
    let(:user_email) { 'john@doe.com' }

    it 'should return user email and 0.0 total to pay when user have no active offers' do
      user = instance_double('user', user_email:)

      user_repo = instance_double('user_repo', all: [user])
      offer_repo = instance_double('offer_repo', all_active: [])

      biller = described_class.new(user_repo, offer_repo)
      expect(biller.create_all_users_billing[0][:user_email]).to eq user_email
      expect(biller.create_all_users_billing[0][:amount_to_pay]).to eq 0.0
    end
  end
end
