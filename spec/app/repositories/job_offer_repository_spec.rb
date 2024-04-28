require 'integration_spec_helper'

describe JobOfferRepository do
  let(:repository) { described_class.new }

  let(:owner) do
    user = User.new(name: 'Joe', email: 'joe@doe.com', crypted_password: 'SecureP4$$word')
    UserRepository.new.save(user)
    user
  end

  describe 'is Job Offer well persisted?' do
    let!(:complete_offer) do
      complete_offer = JobOffer.new(title: 'a title',
                                    location: 'a location',
                                    description: 'a description',
                                    required_experience: 10,
                                    created_on: Date.today,
                                    updated_on: Date.today,
                                    is_active: true,
                                    user_id: owner.id)
      repository.save(complete_offer)
      complete_offer
    end

    it 'should be able to save and load a complete Job Offer, with title and required exprience persisted correctly' do
      saved_offer = repository.find(complete_offer.id)
      expect(saved_offer.title).to eq complete_offer.title
      expect(saved_offer.required_experience).to eq 10
    end
  end

  describe 'deactive_old_offers' do
    let!(:today_offer) do
      today_offer = JobOffer.new(title: 'a title',
                                 updated_on: Date.today,
                                 is_active: true,
                                 user_id: owner.id)
      repository.save(today_offer)
      today_offer
    end

    let!(:thirty_day_offer) do
      thirty_day_offer = JobOffer.new(title: 'a title',
                                      updated_on: Date.today - 45,
                                      is_active: true,
                                      user_id: owner.id)
      repository.save(thirty_day_offer)
      thirty_day_offer
    end

    it 'should deactivate offers updated 45 days ago' do
      repository.deactivate_old_offers

      updated_offer = repository.find(thirty_day_offer.id)
      expect(updated_offer.is_active).to eq false
    end

    it 'should not deactivate offers created today' do
      repository.deactivate_old_offers

      not_updated_offer = repository.find(today_offer.id)
      expect(not_updated_offer.is_active).to eq true
    end
  end
end
