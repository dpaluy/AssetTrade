$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'factories'))
require 'rspec'
require 'rr'
require 'factory_girl'

Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  config.mock_with :rr

  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end
