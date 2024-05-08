require 'spec_helper'
describe SubscriptionFactory do
  describe 'create_from_string' do
    it 'should create an ONG subscription' do
      subscription = described_class.create_from_string('ONG')
      expect(subscription).to be_a(SubscriptionONG)
    end

    it 'should create an on-demand subscription when empty string' do
      subscription = described_class.create_from_string('')
      expect(subscription).to be_a(SubscriptionOnDemand)
    end

    it 'should raise error when invalid string' do
      invalid_subscription_type = 'NotASubcription'
      expect do
        described_class.create_from_string(invalid_subscription_type)
      end.to raise_error(InvalidSubscriptionTypeError)
    end
  end

  describe 'create_from_object' do
    it 'should create an ONG subscription type (string)' do
      subscription = SubscriptionONG.new
      subscription_type = described_class.create_from_object(subscription)
      expect(subscription_type).to eq 'ONG'
    end

    it 'should raise error when invalid subscription' do
      invalid_subscription = nil
      expect { described_class.create_from_object(invalid_subscription) }.to raise_error(InvalidSubscriptionError)
    end
  end
end
