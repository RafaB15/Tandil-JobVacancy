require 'spec_helper'
describe SubscriptionFactory do
  describe 'create_from_string' do
    it 'should create an ONG subscription' do
      subscription = described_class.create_from_string('ONG')
      expect(subscription).to be_a(SubscriptionONG)
    end
  end
end
