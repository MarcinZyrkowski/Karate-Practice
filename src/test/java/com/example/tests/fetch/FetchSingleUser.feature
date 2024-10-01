@regression
Feature: Fetch single user

  Background:
    * call read('../utils/Hooks.feature@config')

  @debug
  Scenario: Fetch single user
    # preconditions
    * def expectedResponse = tm.singleUserResponseFactory.userWithId2()

    # get single user with id 2
    Given path '/api/users/2'
    When method get
    Then status 200

    # verify
    And tm.singleUserResponseAssertion.verifySchema(response)
    And tm.singleUserResponseAssertion.verifyResponseIsAsExpected(response, expectedResponse)
