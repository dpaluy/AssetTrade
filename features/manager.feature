Feature: Manager
  In order to earn money
	As a stock market investor
	I want to start automatic portfolio management strategy
  
  Scenario: Create inital position - asset
	  Given Asset price is 1100
	  And I have entered 110000 coins into my account
	  When I start portfolio management
	  Then it should buy assets worth 30% of portfolio
    
