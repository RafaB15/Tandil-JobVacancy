require 'spec_helper'

describe JobOffer do
  subject(:job_offer) { described_class.new }

  describe 'model' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:location) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:owner) }
    it { is_expected.to respond_to(:owner=) }
    it { is_expected.to respond_to(:created_on) }
    it { is_expected.to respond_to(:updated_on) }
    it { is_expected.to respond_to(:is_active) }
  end

  describe 'valid?' do
    it 'should be false when title is blank' do
      job_offer.title = ''
      expect(job_offer).not_to be_valid
    end
  end

  describe 'deactive_old_offers' do
    let(:today_offer) do
      today_offer = described_class.new
      today_offer.updated_on = Date.today
      today_offer.is_active = true
      today_offer
    end

    let(:thirty_day_offer) do
      thirty_day_offer = described_class.new
      thirty_day_offer.updated_on = Date.today - 45
      thirty_day_offer.is_active = true
      thirty_day_offer
    end

    it 'should deactivate offers updated 45 days ago' do
      expect(described_class).to receive(:where)
        .with(is_active: true)
        .and_return([thirty_day_offer])
      described_class.deactivate_old_offers
      expect(thirty_day_offer.is_active).to eq false
    end

    it 'should not deactivate offers created today' do
      expect(described_class).to receive(:where).with(is_active: true).and_return([today_offer])
      described_class.deactivate_old_offers
      expect(today_offer.is_active).to eq true
    end
  end
end
