source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.0.3', '>= 6.0.3.3'

gem 'devise'
gem 'cancancan'
gem 'rolify'
gem 'aws-sdk-s3', require: false
gem 'active_storage_validations'
gem 'image_processing', '~> 1.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'capistrano',           require: false
  gem 'capistrano-rbenv',     require: false
  gem 'capistrano-rails',     require: false
  gem 'capistrano-bundler',   require: false
  gem 'capistrano3-puma',     github: "seuros/capistrano-puma"
  gem 'capistrano-passenger', git: 'https://github.com/capistrano/passenger.git', branch: 'master'
  #
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  #
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
