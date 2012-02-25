require 'market_data'
require 'order'
require 'portfolio'
require 'settings'
require 'set'
require 'stock_market'
require 'tools/numeric'

class Manager
  
  attr_reader :settings, :stock_market
  
  def initialize
    @settings = Settings.new  
    @order_set = Set.new # SortedSet
    @stock_market = StockMarket.new # TODO
  end
  
  def get_last_index_value
    @stock_market.get_index(@settings.index_id)  
  end
  
  def get_current_volatility
    @stock_market.get_volatility(@settings.index_id)
  end
  
  def get_asset_data
    @stock_market.get_data(@settings.asset_id)
  end
    
  def build_initial_position(portfolio)
    strike = get_last_index_value
    make_initial_asset_order(portfolio, strike)
    volatility = get_current_volatility
    make_option_order(portfolio, strike, volatility)
  end
  
  private
  
  def get_initial_quantity(price, initial_investment, asset_adjustment)
    asset_adjustment.percent_from(initial_investment).to_i / price
  end

#    case @settings.measure(volatility)
#      when Settings::LOW
#      
#      when Settings::MEDIUM
#      
#      when Settings::HIGH
#      
#    end

  def make_option_order(portfolio, strike, volatility)
  
  end
    
  def make_initial_asset_order(portfolio, strike)
    market_data = get_asset_data
    buy_price = market_data.ask_price
    quantity = get_initial_quantity(buy_price, portfolio.initial_invest, @settings.asset_adjustment)
    order = Order.new(@settings.asset_id, quantity, buy_price)
    asset_execute(portfolio, order)
  end
  
  def asset_execute(portfolio, order)    
    # TODO
    # send_order_to_market(order)
    # get execution result
    portfolio.add_asset(order)
  end

end
