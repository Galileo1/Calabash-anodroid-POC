Feature: Demo feature
Scenario: Login Logout
  When I login to trademe as user 'XXXX'
  Then I should be logged in
  And I am navigated to 'Account' screen
  And I should be logged out

Scenario: TopUp Account
  When I login to trademe as user 'XXXX'
  Then I should be logged in
  And I am navigated to 'Account' screen
  And user chooses to credit their account
  #And user selects to enter card details
  And user enters the cc number
  And user enters the cc name
  And user enters the cc expiry date
  And user enters the cc CVV number
  And user select to save this card
  And user makes the payment
  And I should be logged out