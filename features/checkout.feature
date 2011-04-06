Feature: Placing an order
	In order to buy wine
	As a potential customer
	I want to be able to place an order

	Scenario: A customer checks out.
		Given there is a wine
		When I select a wine to be bought
		And I checkout my cart
		Then I should see Checkout
		When I accept
		And I fill in the following:
			| Firstname 		| Ronald 				 		|
			| Surname	  		| Hecker				 		|
			| Address 			| Ghijseland 125 		|
			| Postalcode  	| postcode			 		|
			| Email					| ronald@l2code.nl 	|
			| Accountnumber	| 123456789					|
			| Accountowner	| Ronald Hecker			|
		And I submit the checkout		
		Then "shop@chiantivinimport.dk" should receive an email
		When they open the email
		Then they should see "New order" in the email subject
