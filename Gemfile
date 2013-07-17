source 'https://rubygems.org'

ruby '1.9.3'
# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'slim'
gem 'dm-sqlite-adapter'
gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-constraints'
gem 'dm-aggregates'
gem 'dm-types'
gem 'dm-core'
gem 'therubyracer'
gem 'padrino-sprockets', :require => "padrino/sprockets"
gem 'uglifier', '2.1.1'
gem 'yui-compressor', '0.9.6'
gem 'bcrypt-ruby', :require => 'bcrypt'

# Test requirements


# Padrino Stable Gem
gem 'padrino', '0.11.2'

group :development, :test do
  gem 'guard'		
  gem 'guard-rspec'
  gem 'cucumber'
  gem 'capybara'
  gem 'rspec_junit_formatter'
  gem 'rspec'
  gem 'simplecov'
  gem 'rack-test', :require => 'rack/test'
  gem 'rubocop',  :github => 'bbatsov/rubocop'
end

group :development do
  gem 'debugger'
end

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.2'
# end
