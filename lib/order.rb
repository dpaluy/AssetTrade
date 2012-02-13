require "tools/value_enums"
require 'digest/sha2'

class Order
  attr_reader :id, :quantity, :price, :timestamp, :status, :asset_id
  enums %w(NA, SENT, HALF_DONE, DONE)
  
  def initialize(asset_id, quantity, price)
    @quantity = quantity
    @price = price
    @timestamp = Time.now
    @status = Order::NA
    @asset_id = asset_id
    h = Digest::SHA2.new
    @id = h << "#{timestamp}#{asset_id}"    
  end
  
  def sent_to_exchange
    @status = Order::SENT
  end
  
  def done(is_completed = true)
    @status = (is_completed) ? Order::DONE : Order::HALF_DONE
  end
  
  def to_s
    "Order: #{@id}, #{@status}, #{@timestamp} - #{@asset_id}, #{@quantity}, #{@price}"
  end
end
