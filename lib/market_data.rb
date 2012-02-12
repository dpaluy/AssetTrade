require "time"

class MarketData
  attr_reader :name, :bid_price, :bid_volume, :ask_price, :ask_volume, :last_price, :timestamp
  
  def initialize(name, bid_price, bid_volume, ask_price, ask_volume, last_price)
    @name = name
    @bid_price = bid_price
    @bid_volume = bid_volume
    @ask_price = ask_price
    @ask_volume = ask_volume
    @last_price = last_price
    @timestamp = Time.now
  end
  
end
