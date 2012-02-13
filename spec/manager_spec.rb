require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "manager"
require "portfolio"

describe "Manager" do
  before(:each) do
    @portfolio = Portfolio.new 150000
    @manager = Manager.new    
  end
  
  it 'should build initial position' do
    mock(Manager).get_last_index_value {1500}
    @manager.build_initial_position(@portfolio)
#    @portfolio.total_asset
  end
end
