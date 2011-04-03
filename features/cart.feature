Feature: Placing wine in a cart

  In order to buy wine
  As a potential customer
  I want to select multiple wines to be bought

  @wip
  Scenario: Adding a wine to the cart
    Given there is a wine
    When I select a wine to be bought
    Then I should have the wine in my cart
