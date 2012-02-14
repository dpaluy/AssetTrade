require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "tools/numeric"

describe "Numeric" do
  it 'should calculate correct percentage of' do
    budget = 100
    10.percent_of(budget).should eql(10.to_f)
    
    budget = 200
    50.percent_of(budget).should eql(25.to_f)
  end
  
  it 'should calculate correct percentage from' do
    budget = 100
    10.percent_from(budget).should eql(10.to_f)
    
    budget = 200
    50.percent_from(budget).should eql(100.to_f)
    
    budget = 110000
    30.percent_from(budget).should eql(33000.to_f)
  end

end
