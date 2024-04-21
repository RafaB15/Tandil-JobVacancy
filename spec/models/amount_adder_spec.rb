require 'spec_helper'

describe AmountAdder do
  describe 'add_amount' do
    it 'should be 0 when no active offers' do
      repo = instance_double('offer_repo', all_active: [])
      counter = described_class.new(repo)
      expect(counter.add_amount).to eq 0
    end

    it 'should be 40 when there are 4 active offers' do
      job_offer = instance_double('job_offer')
      repo = instance_double('offer_repo', all_active: [job_offer, job_offer, job_offer, job_offer])
      counter = described_class.new(repo)
      expect(counter.add_amount).to eq 40
    end

    xit 'should be 160 when there are 0 active offers from 2 corporate users' do
      repo = instance_double('offer_repo', all_active: [])
      items = instance_double('all_bills', [{ amount: 80 }, { amount: 80 }])
      counter = described_class.new(repo, items)
      expect(counter.add_amount).to eq 160
    end
  end
end
