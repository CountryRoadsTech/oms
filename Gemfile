# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Use latest, stable version of Rails
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

# Use Good Job to process background jobs asynchronously
gem 'good_job'

# Use Simple Form to simplify creating forms
gem 'simple_form'

# Use Pagy to paginate models in controllers and display pagination helpers in views
gem 'pagy'

# Use Local Time to display dates and times in the user's local timezone
gem 'local_time'

# Use Friendly ID to configure a different URL attribute for the slug other than ID
gem 'friendly_id'

# Use Paper Trail to track and store changes to models
gem 'paper_trail'

# Use Devise to add user authentication
gem 'devise'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: [:mri, :mingw, :x64_mingw]

  # Rubocop is used to enforce coding style through static analysis
  gem 'rubocop', require: false
  # Rubocop Rails adds Rails specific checks to Rubocop
  gem 'rubocop-rails', require: false
  # Rubocop RSpec adds RSpec test specific checks to Rubocop
  gem 'rubocop-rspec', require: false
  # Rubocop Rake adds Rake task specific checks to Rubocop
  gem 'rubocop-rake', require: false
  # Rubocop Performance adds performance specific checks to Rubocop
  gem 'rubocop-performance', require: false

  # Brakeman is used for static security analysis
  gem 'brakeman'

  # RSpec is used to replace the default testing framework
  gem 'rspec-rails'
  # Capybara is used to write integration/feature tests
  gem 'capybara'
  # Selenium Webdriver is used to simulate how a real user interacts with the web browser during testing
  gem 'selenium-webdriver'
  # Factory Bot is used to replace the default tests fixtures
  gem 'factory_bot_rails'
  # Shoulda Matchers adds many, common one-line RSpec test matchers
  gem 'shoulda-matchers'
  # Faker is used to generate pseudorandom test data
  gem 'faker'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Use Foreman to launch both the yarn and rails server in development side-by-side
  gem 'foreman'

  # Automtically add a comment with the database schema to the top of relevant Rails files
  gem 'annotate'

  # Rails Mini Profiler adds a request performance dashboard
  gem 'rails_mini_profiler'

  # Stack Prof is used by Rails Mini Profiler to store Flamegraphs
  gem 'stackprof'

  # Bullet is used to detect N+1 database queries that should be optimized
  gem 'bullet'

  # Overcommit is used to run checks before each 'git commit' and 'git push'
  gem 'overcommit'
end
