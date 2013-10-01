source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
group :development, :test do
  gem 'sqlite3'
end

# New Relic email: brentd49@gmail.com
gem 'newrelic_rpm'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Twitter Bootstrap (w/SCSS)
gem 'bootstrap-sass'

# Get more icons for bootstrap
gem "font-awesome-rails"

# Simple form (uses bootstrap for style)
gem 'simple_form', '~> 3.0.0.rc'

# Date picker
# gem 'bootstrap-datepicker-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Authentication & Authorization
gem 'devise'
#gem 'devise_invitable'
gem 'devise_invitable', :github => 'scambra/devise_invitable'

# Consume third-party APIs
gem 'httparty'

gem 'omniauth-facebook'
gem 'koala'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Displays mail at http://localhost:1080/ (intercepts mail sent through smtp://localhost:1025)
# gem 'mailcatcher', group: [:development, :test] # do not put in Gemfile
# gem install mailcatcher
# mailcatcher

# Use debugger
# gem 'debugger', group: [:development, :test]
