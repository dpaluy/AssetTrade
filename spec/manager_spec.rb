require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "manager"
require "portfolio"
require "tools/numeric"
require "tools/array"

describe "Manager" do
  before(:each) do
    @portfolio = Portfolio.new 150000
    @manager = Manager.new    
  end
  
  it 'should build initial position' do
    asset_data = get_asset_data(1500)
    stub(@manager.stock_market).get_index(@manager.settings.index_id) {1500}
    stub(@manager.stock_market).get_data(@manager.settings.asset_id) {asset_data}
    @manager.build_initial_position(@portfolio)
    @portfolio.total_asset.should eql((30.percent_from(150000) / 1500).to_i)
  end
  
  def get_asset_data(price)
    name = @manager.settings.asset_id
    bid_price = price - 10
    bid_volume = 100
    ask_price = price + 10
    ask_volume = 90
    last_price = price
    MarketData.new(name, bid_price, bid_volume, ask_price, ask_volume, last_price)    
  end
  
end
