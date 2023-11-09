source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "pry"
  gem "rspec-rails", "~> 6.0.0"
  gem "factory_bot_rails"
  gem "shoulda-matchers", "~> 5.0"
end

group :development do
  gem "web-console"
  gem "dockerfile-rails"
end


gem "sentry-ruby", "~> 5.12"
gem "sentry-rails", "~> 5.12"
