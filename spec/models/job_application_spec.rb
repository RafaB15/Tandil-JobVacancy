require 'spec_helper'

describe JobApplication do
  let(:job_offer) { JobOffer.new(title: 'a title') }

  describe 'valid?' do
    it 'should be invalid when email is blank' do
      check_validation(:applicant_email, "Applicant email can't be blank") do
        described_class.create_for(nil, job_offer)
      end
    end

    it 'should be invalid when offer is blank' do
      check_validation(:job_offer, "Job offer can't be blank") do
        described_class.create_for('applicant@test.com', nil)
      end
    end

    it 'should be invalid when cv link exists and does not contain .com' do
      check_validation(:cv_link, 'Cv link must contain ".com"') do
        described_class.new('applicant@test.com', job_offer, 'www.linkedin/juan')
      end
    end

    it 'should be invalid when cv link exists and does not contain www.' do
      check_validation(:cv_link, 'Cv link must contain "www."') do
        described_class.new('applicant@test.com', job_offer, 'linkedin/juan.com')
      end
    end

    it 'should be valid when cv link exists' do
      job_application = described_class.create_for('applicant@test.com', job_offer, 'www.linkedin/juan.com')
      expect(job_application.valid?).to eq true
    end
  end

  describe 'create_for' do
    it 'should set applicant_email' do
      email = 'applicant@test.com'
      ja = described_class.create_for(email, job_offer)
      expect(ja.applicant_email).to eq(email)
    end

    it 'should set job_offer' do
      offer = job_offer
      ja = described_class.create_for('applicant@test.com', offer)
      expect(ja.job_offer).to eq(offer)
    end
  end

  describe 'process' do
    it 'should deliver contact info notification' do
      ja = described_class.create_for('applicant@test.com', job_offer)
      expect(JobVacancy::App).to receive(:deliver).with(:notification, :contact_info_email_to_employer, ja)
      expect(JobVacancy::App).to receive(:deliver).with(:notification, :contact_info_email_to_applicant, ja)
      ja.process
    end
  end
end
