require 'spec_helper'

describe UserBiller do
  describe 'create_all_users_billing' do
    let(:user_email) { 'john@doe.com' }

    xit 'should return user email and 0.0 total to pay when user have no active offers' do
      user = instance_double('user', user_email:, subscription_type: SubscriptionOnDemand.new)
      job_offer = instance_double('job_offer', owner: user, is_active: false)
      repo = instance_double('offer_repo', all_active: [job_offer])
      biller = described_class.new(repo)
      expect(biller.create_all_users_billing[0]['user_email']).to eq user_email
      expect(biller.create_all_users_billing[0]['amount_to_pay']).to eq 0.0
    end
  end
end
