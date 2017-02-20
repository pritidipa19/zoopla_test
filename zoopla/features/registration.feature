Feature: as a new user i should able to register in zoopla homepage
  Scenario: register in a zoopla home page
    Given i am on zoopla home page
    Given i am on zoopla registration page
    When i can enter valid email and password
#    Then i should able to register

  Scenario: email should be the same on email and confirm email fields
    Given i am on zoopla home page
    Given i am on zoopla registration page
    And I enter "abc@gmail.com" into the textfield with id "register_email"
    And I enter "abcd@gmail.com" into the textfield with id "register_email_confirm"
    And I enter "Password1" into the textfield with id "register_password"
    When I click "register_submit" button with id
    Then I should see "Please enter the same value again." case insensitive message on the browser