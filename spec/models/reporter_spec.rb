require 'spec_helper'
describe Reporter do
  describe 'report' do
    it 'should report zero when there are no active offers' do
      offer_counter = instance_double('OfferCounter', count_active: 0)
      user_biller = instance_double('UserBiller', create_all_users_billing: [])
      reporter = described_class.new(offer_counter, user_biller)
      report = reporter.report
      expect(report[:total_amount]).to eq 0
      expect(report[:total_active_offers]).to eq 0
    end
  end
end
