include RR::Adapters::RRMethods

def default_asset_market_data(price)
  name        = '1091826'
  bid_price   = (price - 10)
  bid_volume  = 100
  ask_price   = (price + 10)
  ask_volume  = 90
  last_price  = price
  MarketData.new(name, bid_price, bid_volume, ask_price, ask_volume, last_price)
end

Given /^I chose a manager$/ do
  @manager = Manager.new
end

Given /^Asset price is (\d+)$/ do |price|
  @asset_price = price.to_i
  asset_data = default_asset_market_data(price.to_i)
  stub(@manager.stock_market).get_index(@manager.settings.index_id) {price.to_i}
  stub(@manager.stock_market).get_data(@manager.settings.asset_id) {asset_data}
end

Given /^I have entered (\d+) coins into my account$/ do |initial_sum|
  @initial_invest = initial_sum.to_i
  @portfolio = Portfolio.new(initial_sum.to_i)
  @portfolio.total_asset.should eql(0)
end

When /^I start portfolio management$/ do
  @manager.build_initial_position(@portfolio)
end

Then /^it should buy assets worth (\d+)% of portfolio$/ do |percentage|
  stock_invest = (@initial_invest * percentage.to_i / 100)
  @portfolio.total_asset.should eql(stock_invest / (@asset_price + 10))
end

