Given /^Asset price is (\d+)$/ do |price|
  @asset_price = price
end

Given /^I have entered (\d+) coins into my account$/ do |initial_sum|
  @initial_invest = initial_sum
  @portfolio = Portfolio.new(initial_sum)
end

When /^I start portfolio management$/ do
  @manager = Manager.new
  @manager.build_initial_position(@portfolio)
end

Then /^it should buy assets worth (\d+)% of portfolio$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

