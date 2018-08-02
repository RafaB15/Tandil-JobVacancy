require_relative '../models/user'

user = User.create(email: 'offerer@test.com',
									 name: 'Offerer',
									 password: "Passw0rd!") unless User.all.count > 0
