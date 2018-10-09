require File.expand_path(File.dirname(__FILE__) + '/../../config/boot')

require 'capybara/cucumber'
require 'rspec/expectations'

require 'simplecov'

SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '..', '..'))
  coverage_dir 'reports/coverage'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/admin/'
  add_filter '/db/'
  add_filter '/config/'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
end

unless User.all.count.positive?
  User.create(email: 'offerer@test.com',
              name: 'Offerer',
              password: 'Passw0rd!')
end

# Capybara.default_driver = :selenium
Capybara.app = JobVacancy::App.tap { |app| }
