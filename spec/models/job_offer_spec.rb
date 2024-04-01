require 'spec_helper'

describe JobOffer do
  subject(:job_offer) { described_class.new({ title: 'Test' }) }

  describe 'model' do
    it { is_expected.to respond_to(:required_experience) }
  end

  describe 'valid?' do
    it 'should be invalid when title is blank' do
      check_validation(:title, "Title can't be blank") do
        described_class.new(location: 'a location')
      end
    end

    it 'should be valid when title is not blank' do
      job_offer = described_class.new(title: 'a title')
      expect(job_offer).to be_valid
    end
  end
end
