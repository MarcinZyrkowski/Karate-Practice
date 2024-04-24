@full
Feature: Simple requests
  
  Background:
    * url baseURL
  
  Scenario: Get list of users
    Given path 'api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
  
  Scenario: Create new user
    * def requestBody =
      """
      {
        "name": "Marcin",
        "job": "QA"
      }
      """
    * def expectedResponse =
      """
      {
        "name": "Marcin",
        "job":  "QA",
        "id": "#string",
        "createdAt":  "#ignore"
      }
      """
    # "id": #string means id should be a string, not specified value but a type
    # "#ignore means we ignore whatever is there
    
    Given path 'api/users'
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response == expectedResponse
