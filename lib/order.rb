require "tools/value_enums"

class Order
  attr_reader :quantity, :price, :timestamp, :status
  enums %w(NA, SENT, HALF_DONE, DONE)
  
  def initialize(quantity, price)
    @quantity = quantity
    @price = price
    @timestamp = Time.now
    @status = Order::NA
  end
  
  def sent_to_exchange
    @status = Order::SENT
  end
  
  def done(is_completed = true)
    @status = (is_completed) ? Order::DONE : Order::HALF_DONE
  end
end
