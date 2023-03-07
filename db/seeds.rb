require_relative '../models/user'
require_relative '../models/job_offer'

user_repository = UserRepository.new
unless user_repository.all.count.positive?
  test_user = User.new(email: 'offerer@test.com',
                       name: 'Offerer',
                       password: 'Passw0rd!')

  user_repository.save test_user
end

test_user = user_repository.find_by_email 'offerer@test.com'

offer_repository = JobOfferRepository.new
ruby_offer = JobOffer.new(title: 'Ruby Dev',
                          location: 'Baires, Argentina',
                          description: 'Remote',
                          is_active: true)
ruby_offer.owner = test_user
offer_repository.save ruby_offer

node_offer = JobOffer.new(title: 'Node Dev',
                          location: 'Rio, Brazil',
                          description: 'Remote',
                          is_active: true)
node_offer.owner = test_user
offer_repository.save node_offer
