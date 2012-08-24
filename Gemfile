source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

platforms :mri do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'jruby-openssl'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby, :require => false

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'rspec-rails', :group => [:test, :development]

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

gem 'puma'

gem 'kaminari'
gem 'cells'
gem 'russian'
# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test do
  gem 'rspec-nokogiri', :git => "git://github.com/imomoisoft/rspec-nokogiri.git"

  gem 'rb-readline'
  gem 'timecop'
  gem 'factory_girl'
  gem 'factory_girl_rails'
#  gem 'rspec-cells'
  gem 'capybara'
  gem 'guard-rspec', :require => false
  gem 'libnotify', :require => false
  gem 'rb-inotify', :require => false
  gem 'spork', :require => false
  gem 'guard-spork', :require => false
  gem 'turn', :require => false
end
