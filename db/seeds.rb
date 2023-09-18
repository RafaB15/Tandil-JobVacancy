require_relative '../models/user'
require_relative '../models/job_offer'

user_repository = UserRepository.new
unless user_repository.all.count.positive?
  test_user = User.new(email: 'offerer@test.com',
                       name: 'Offerer',
                       password: 'Passw0rd!')

  user_repository.save test_user
end
