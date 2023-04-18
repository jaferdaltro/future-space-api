# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'devise_token_auth', '>= 1.2.0', git: 'https://github.com/lynndylanhurley/devise_token_auth'
gem 'httparty'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.3'
gem 'redis', '~> 4.7', '>= 4.7.1'
gem 'rubocop-rails', '~> 2.19', '>= 2.19.1', require: false
gem 'sidekiq', '~> 6.5', '>= 6.5.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'whenever', require: false

group :development, :test do
  gem 'awesome_print', '~> 1.9', '>= 1.9.2'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
