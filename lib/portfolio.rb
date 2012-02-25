class Portfolio

  attr_reader :initial_invest, :assets
  
  # TODO compare specific asset id
  
  def initialize(initial_invest)
    @initial_invest = initial_invest  
    @assets = []
    @options = []
  end

  def add_asset(order)
    @assets << order.quantity
  end
  
  def total_asset
    @assets.sum
  end
end
