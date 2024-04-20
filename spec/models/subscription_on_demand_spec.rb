require 'spec_helper'

describe SubscriptionOnDemand do
  describe 'compute_amount_to_pay_for_total_active_offers' do
    it 'should be 0 when no active offers' do
      total_active_offers = 0
      subscription_type = described_class.new

      expect(subscription_type.compute_amount_to_pay_for_total_active_offers(total_active_offers)).to eq 0
    end
  end
end
