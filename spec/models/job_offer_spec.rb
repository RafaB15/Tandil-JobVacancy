require 'spec_helper'

describe JobOffer do
  subject(:job_offer) { described_class.new({ title: 'Test' }) }

  describe 'model' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:location) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:required_experience) }
    it { is_expected.to respond_to(:is_active) }
    it { is_expected.to respond_to(:updated_on) }
    it { is_expected.to respond_to(:created_on) }
    it { is_expected.to respond_to(:user_id) }
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

    it 'should be invalid when required experience is string' do
      check_validation(:required_experience, 'Required experience invalid') do
        described_class.new(title: 'a title', required_experience: 'Experienced')
      end
    end

    it 'should be invalid when required experience is negative integer' do
      check_validation(:required_experience, 'Required experience invalid') do
        described_class.new(title: 'a title', required_experience: '-5')
      end
    end

    it 'should be invalid when required experience is float value' do
      check_validation(:required_experience, 'Required experience invalid') do
        described_class.new(title: 'a title', required_experience: '1.5')
      end
    end
  end

  describe 'saved correctly?' do
    it 'should be saved as nil when required experience is blank' do
      job_offer = described_class.new(title: 'a title')
      expect(job_offer.required_experience).to eq nil
    end
  end
end
