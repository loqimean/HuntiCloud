source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.2", ">= 7.0.2.2"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
# gem "jbuilder"
gem "redis", "~> 4.0"
gem 'database_cleaner-active_record'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'carrierwave', '~> 2.2'
gem 'devise', '~> 4.8'
gem 'exifr', '~> 1.3'
gem 'tailwindcss_merger'
gem 'rest-client' # try to use lighter gem like HTTParty or Faraday
gem 'fake_picture', '~> 0.2.2'
gem "avatarro"
gem 'simple_form', git: 'https://github.com/loqimean/simple_form.git', branch: 'main'
gem 'ransack'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]

  gem 'rspec-rails'

  gem 'factory_bot_rails'
  gem 'faker', '~> 2.19'
end

group :development do
  gem 'web-console'
  gem 'annotate'

  # Deploy
  gem 'capistrano', '~> 3.7'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-yarn'
  gem 'capistrano-linked-files'
  gem 'capistrano-rvm'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  gem 'spring'
end

group :production do
  gem 'passenger'
end

group :test do
  gem 'simplecov', require: false
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 5.0'
end
