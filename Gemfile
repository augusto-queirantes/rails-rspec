source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

# Database
gem 'pg', '~> 1.1'

# Server
gem 'puma', '~> 5.0'

# Boot time
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'pry-rails'

  # Console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Specs
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.3'

  # Speed up application
  gem 'spring'
end
