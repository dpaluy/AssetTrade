require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "order" 

describe "Order" do

  before(:each) do
    @params = {quantity: 10, price: 250}
    @order = Order.new  @params[:quantity], @params[:price]
  end
  
  it 'should create order with initialized params' do
    now = Time.now
    @order.timestamp.should be_within(1).of(now)
    @order.status.should eql(Order::NA)
  end
  
  it 'should update status on sending order' do
    @order.sent_to_exchange
    @order.status.should eql(Order::SENT)    
  end
  
  it 'should update status on order proceeding' do
    @order.done(false)
    @order.status.should eql(Order::HALF_DONE)
    @order.done
    @order.status.should eql(Order::DONE)
  end  
end

