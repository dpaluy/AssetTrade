require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'settings'

describe Settings do
  
  before(:each) do
    @settings = Settings.new
  end
  
  it 'should measure LOW volatility' do
    @settings.measure(17).should eql(Settings::LOW)
  end
  
  it 'should measure MEDIUM volatility' do
    @settings.measure(18).should eql(Settings::MEDIUM)
  end

  it 'should measure HIGH volatility' do
    @settings.measure(28).should eql(Settings::HIGH)
  end

end
