source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'

gem 'coffee-rails'
gem 'haml'
gem 'jquery-rails'
gem 'puma', '~> 3.11'

gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'
# gem 'sass-rails', '~> 5.0'

gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'bootsnap', '>= 1.1.0', require: false
  gem 'byebug', platforms: :mri
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'webdrivers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
end
