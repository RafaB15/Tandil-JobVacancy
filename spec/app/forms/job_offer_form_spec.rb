require 'spec_helper'

# Creates a completly valid Job Offer with all its fields filled
def initialize_job_offer_with_valid_id
  repository = JobOfferRepository.new

  owner = User.new(name: 'Joe', email: 'joe@doe.com', crypted_password: 'secure_P4$$word')
  UserRepository.new.save(owner)

  job_offer = JobOffer.new(title: 'a title',
                           location: 'a location',
                           description: 'a description',
                           required_experience: 10,
                           created_on: Date.today,
                           updated_on: Date.today,
                           is_active: true,
                           user_id: owner.id)

  # Need to save in repository to create a valid ID
  repository.save(job_offer)

  job_offer
end

describe JobOfferForm do
  subject(:job_offer_form) do
    job_offer = initialize_job_offer_with_valid_id
    described_class.from(job_offer)
  end

  describe 'model' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:location) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:required_experience) }
  end
end
