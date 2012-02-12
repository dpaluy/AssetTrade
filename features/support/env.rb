require 'bundler'

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

Dir[File.dirname(__FILE__) + '/../../lib/*.rb'].each {|file| require file }
require 'rspec/expectations'
