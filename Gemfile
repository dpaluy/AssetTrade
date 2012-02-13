source "http://rubygems.org"

require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

group :development do
  gem "rspec", "~> 2.8.0"
  gem "rdoc", "~> 3.12"
  gem "cucumber", ">= 0"
  gem "bundler", "~> 1.0.0"
  gem "simplecov"
  gem "rr"
  gem 'factory_girl'
  gem "guard"
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'win32console'
      gem 'rb-notifu'
  end
end
