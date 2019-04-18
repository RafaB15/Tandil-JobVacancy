require_relative '../models/user'

user_repository = UserRepository.new
unless user_repository.all.count.positive?
  user = User.new(email: 'offerer@test.com',
                  name: 'Offerer',
                  password: 'Passw0rd!')

  user_repository.save user
end
