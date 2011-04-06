Feature: Placing wine in a cart

  In order to buy wine
  As a potential customer
  I want to select multiple wines to be bought

  Scenario: Adding a wine to the cart
    Given there is a wine
    When I select a wine to be bought
    Then I should have the wine in my cart

  Scenario: Adding 2 wines to the cart
    Given there is a wine
    And there is another wine
    When I select a wine to be bought
    And I select another wine to be bought
    Then I should have both wines in the cart

  Scenario: Adding 2 of the same wines to the cart
    Given there is a wine
    When I select a wine to be bought
    And  I select a wine to be bought
    Then I should have 2 of that wine in my cart
		And I should be notified that I added 2 of the same wines to a cart
    
  Scenario: Removing a wine from the cart
    Given there is a wine
    And I select a wine to be bought
    When I remove the wine from the cart
    Then I should no wines in my cart
	
	Scenario: Changing the quantity of the wine selected in a cart
		Given there is a wine
		And I select a wine to be bought
		When I select 5 of that wine
		Then I should have 5 of that wine in my cart
		And I should be notified that I changed the wine quantity

