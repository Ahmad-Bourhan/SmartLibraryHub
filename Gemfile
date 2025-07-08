source "https://rubygems.org"

# Core framework for building the application
gem "rails", "~> 8.0.2"

# Asset pipeline support for managing CSS, JS, and images
gem "sprockets-rails"

# Web server for running the application
gem "puma", ">= 5.0"

# Enables importmap to manage JavaScript modules without Node.js
gem "importmap-rails"

# Enables Turbo Drive and Frames for faster page transitions
gem "turbo-rails"

# Stimulus JS framework for adding interactivity
gem "stimulus-rails"

# Helps create and manage JSON APIs
gem "jbuilder"

# PostgreSQL database adapter (used in production)
gem "pg"

# Devise is used for user authentication (sign up, login, etc.)
gem "devise"

# Pundit is used for authorization based on user roles
gem "pundit"

# Prawn is used for generating PDF documents
gem "prawn"

# Chartkick is used to display charts (bar, pie, etc.)
gem "chartkick"

# Provides time zone data support for Windows environments
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Improves boot performance by caching expensive operations
gem "bootsnap", require: false

# Gems needed only in development and testing environments
group :development, :test do
  # SQLite3 is used as the local database in development and testing
  gem "sqlite3", "~> 1.4"

  # Debugging tool for stepping through code
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Scans the code for common security vulnerabilities
  gem "brakeman", require: false

  # Enforces Rails code style conventions
  gem "rubocop-rails-omakase", require: false
end

# Gems needed only in development
group :development do
  # Allows interactive console in the browser on errors
  gem "web-console"
end

# Gems needed only in testing
group :test do
  # Enables system testing by simulating user interactions
  gem "capybara"
  gem "selenium-webdriver"
end
