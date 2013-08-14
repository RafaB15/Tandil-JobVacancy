require 'spec_helper'

describe TwitterClient do

	describe 'publish' do

		it 'should publish the jobOffer title' do
			job_offer = JobOffer.new
			job_offer.title = 'Title'
			Twitter.should_receive(:update).with("New job offer: #{job_offer.title}")			
			TwitterClient.publish(job_offer)
			
		end

	end
end
