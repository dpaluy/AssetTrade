require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "manager"
require "portfolio"
require "tools/numeric"
require "tools/array"

describe "Manager" do

  before(:each) do
    @initial_invest = 110000
    @portfolio = Portfolio.new @initial_invest
    @manager = Manager.new    
  end
  
  it 'should build initial position' do
    asset_data = get_asset_data(1100)
    stub(@manager.stock_market).get_index(@manager.settings.index_id) {1100}
    stub(@manager.stock_market).get_data(@manager.settings.asset_id) {asset_data}
    stub(@manager.stock_market).get_volatility(@manager.settings.index_id) {18}
    @manager.build_initial_position(@portfolio)
    percent_val = @initial_invest / 100 * 30
    @portfolio.total_asset.should eql(percent_val / 1110)
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
