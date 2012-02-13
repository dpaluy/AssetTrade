require 'bundler'
require 'rspec/expectations'
require 'rr'
require 'factory_girl'
require 'factory_girl/step_definitions'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails'
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

Dir[File.dirname(__FILE__) + '/../../lib/**/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../../spec/factories/*.rb'].each {|f| puts f }

