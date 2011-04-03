Feature: Placing wine in a cart

  In order to buy wine
  As a potential customer
  I want to select multiple wines to be bought

  @wip
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