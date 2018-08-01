source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Server requirements
gem 'thin'

# Project requirements
gem 'rake'

# Component requirements
gem 'sequel'

gem 'erubis', '~> 2.7.0'
gem 'therubyracer'
gem 'padrino-sprockets', :require => "padrino/sprockets"
gem 'uglifier', '2.1.1'
gem 'yui-compressor', '0.9.6'
gem 'bcrypt'
gem 'json'
gem 'clockwork'
gem 'twitter'

# Test requirements
group :staging, :production do
  gem 'dm-postgres-adapter'
end

# Padrino Stable Gem
gem 'padrino', '~> 0.14'

group :development, :test do
  gem 'cucumber'
  gem 'capybara'
  gem 'rspec_junit_formatter'
  gem 'rspec'
  gem 'simplecov', "0.8.0.pre"
  gem 'rack-test', :require => 'rack/test'
  gem 'rubocop',  :github => 'bbatsov/rubocop'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'byebug'
end
