Feature: Contact page
  In order to contact the chaintivin import
  As a visitor
  I want to be able to fill in a contactform

  Scenario: Visitor fills in contact form
    Given I go to contact
    When I fill in the following:
      | name  | Ronald Hecker     |
      | email | ronald@l2code.nl  |
      | question  | Question here?    |
    And I submit
    Then "info@chiantivinimport.dk" should receive an email
    When they open the email
    Then they should see "Contact request by Ronald Hecker" in the email subject
    And they should see "Question here?" in the email body

