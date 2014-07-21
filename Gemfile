source 'https://rubygems.org'
ruby "2.1.0"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'pg'
gem 'turbolinks'
gem 'therubyracer', platforms: :ruby
gem 'unicorn'
gem "rails_12factor"
gem 'mandrill_mailer'
gem "sidekiq"
gem "thin"
gem 'sprockets', '2.11.0'
gem 'bootstrap-sass', '~> 3.2'
gem 'figaro'
gem 'faraday'

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'jquery-rails'
  gem "font-awesome-rails"
end

group :development, :test do
  gem 'debugger'
end

group :test do
  gem 'faker'
  gem 'rspec-rails'
  gem 'factory_girl_rails', "~> 4.0"
  gem "database_cleaner"
  gem "shoulda-matchers"
  gem "capybara"
  gem "launchy"
  gem "webmock"
end
