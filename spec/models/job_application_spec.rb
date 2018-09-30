require 'spec_helper'

describe JobApplication do

	describe 'model' do

		subject { @job_offer = JobApplication.new }

		it { is_expected.to respond_to( :applicant_email ) }
		it { is_expected.to respond_to( :job_offer) }

	end


	describe 'create_for' do

	  it 'should set applicant_email' do
	  	email = 'applicant@test.com'
	  	ja = JobApplication.create_for(email, JobOffer.new)
	  	expect(ja.applicant_email).to eq(email)
	  end

	  it 'should set job_offer' do
	  	offer = JobOffer.new
	  	ja = JobApplication.create_for('applicant@test.com', offer)
	  	expect(ja.job_offer).to eq(offer)
	  end

	end


	describe 'process' do

	  let(:job_application) { JobApplication.new }

	  it 'should deliver contact info notification' do
	  	ja = JobApplication.create_for('applicant@test.com', JobOffer.new)
	  	expect(JobVacancy::App).to receive(:deliver).with(:notification, :contact_info_email, ja)
	  	ja.process
	  end

	end

end
