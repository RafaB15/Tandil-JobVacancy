require_relative '../models/user'

unless User.all.count.positive?
  User.create(email: 'offerer@test.com',
              name: 'Offerer',
              password: 'Passw0rd!')
end
