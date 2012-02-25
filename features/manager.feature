Feature: Manager
  In order to earn money
	As a stock market investor
	I want to start automatic portfolio management strategy
  
  Scenario: Create inital position
	  Given I chose a manager
	  And I have entered 110000 coins into my account
 	  And Asset price is 1100
 	  And Market volatility is 20
	  When I start portfolio management
	  Then it should buy assets worth 30% of portfolio
	  And it should buy 1 options P1100 and sell 2 options P1060

