require 'spec_helper'

describe TwitterClient do
  describe 'publish' do
    it 'should publish the jobOffer title' do
      job_offer = JobOffer.new(title: 'Title')
      expect(Twitter).to receive(:update).with("New job offer: #{job_offer.title}")

      described_class.publish(job_offer)
    end
  end
end
