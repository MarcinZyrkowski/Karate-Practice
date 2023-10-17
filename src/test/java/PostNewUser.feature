Feature: Create new user

  Background:
    * url baseURL
    * path 'api/users'

  Scenario: Create new user
    Given request { "name": "Marcin", "job": "QA" }
    When method POST
    Then status 201
    And print response