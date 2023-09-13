Feature: Employees endpoint
  Background: Employees endpoints should allow to get, create, update and delete employees

  @getAll
  Scenario: /employees should return all the employees
    Given I perform a GET to the employees endpoint
    Then I verify status code 200 is returned
    And I verify that the body does not have size 0

  @post
  Scenario: /create should create an employee
    Given I perform a POST to the create endpoint with the following data
      | Diego | 3500 | 26 |
    Then I verify status code 200 is returned
    And I verify that the body does not have size 0
    And I verify the following data in the body response
      | Diego | 3500 | 26 |

  @getId
  Scenario: /employee/id should return an employee with specific id
    Given I perform a Get with specific id equal "1" to the employee endpoint
    Then I verify status code 200 is returned
    And I verify the following data in the all body response
      | 1 | Tiger Nixon | 320800 | 61 |  |
    And I verify the message that says "Successfully! Record has been fetched."

  @put
  Scenario: /update should return an employee update with specific id
    Given I perform a PUT to the update endpoint with the following date and id "2"
      | Carlos | 4000 | 28 |
    Then I verify status code 200 is returned
    And I verify the following data in the body response
      | Carlos | 4000 | 28 |
    And I verify the message that says "Successfully! Record has been updated."

  @delete
  Scenario: /delete should return an employee delete with specific id
    Given I perform a Delete with specific id equal "10" to the employee endpoint
    Then I verify status code 200 is returned
    And I verify number data deleted equal to "10"
    And I verify the message that says "Successfully! Record has been deleted"



