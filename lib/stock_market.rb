require 'market_data'

class StockMarket
  # TODO
    
  def initialize

  end
  
  def get_data(id)
    name = id
    bid_price = nil
    bid_volume = nil
    ask_price = nil
    ask_volume = nil
    last_price = nil
    MarketData.new(name, bid_price, bid_volume, ask_price, ask_volume, last_price)
  end
  
  def get_volatility(id)
    nil
  end
end
