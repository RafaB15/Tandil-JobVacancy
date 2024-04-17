require 'spec_helper'

describe AmountAdder do
  describe 'add_amount' do
    it 'should be 0 when no active offers' do
      repo = instance_double('offer_repo', all_active: [])
      counter = described_class.new(repo)
      expect(counter.add_amount).to eq 0
    end
  end
end
