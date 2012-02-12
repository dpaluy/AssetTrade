require "portfolio"
require "settings"

class Manager
  
  def initialize
    @settings = Settings.new  
    @order_set = Set.new # SortedSet
  end
  
  def get_last_index_value
    # TODO
    1100  
  end
  
  def get_asset_data
    # TODO
    name = "TA25"
    bid_price = nil
    bid_volume = nil
    ask_price = nil
    ask_volume = nil
    last_price = nil
    MarketData.new(name, bid_price, bid_volume, ask_price, ask_volume, last_price)
  end
  
  def update_portfolio(orders)
    # TODO  
  end
  
  def execute(order)    
    # TODO
  end
  
  def build_initial_position(portfolio)
    strike = get_last_index_value
    market_data = get_asset_data
    quantity = get_initial_quantity(strike, portfolio.initial_investment, @settings.asset_adjustment)
    
    #portfolio.asset_actions.create!(:quantity => quantity, :price => strike)    
  end
  
  private
  
  def get_initial_quantity(strike, initial_investment, asset_adjustment)
    (initial_investment * asset_adjustment / 100) / strike
  end
  
end
