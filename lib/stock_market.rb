require 'market_data'

class StockMarket

  def initialize
    # TODO
  end
  
  def get_data(id)
    # TODO
    name = id
    bid_price = nil
    bid_volume = nil
    ask_price = nil
    ask_volume = nil
    last_price = nil
    MarketData.new(name, bid_price, bid_volume, ask_price, ask_volume, last_price)
  end
end
