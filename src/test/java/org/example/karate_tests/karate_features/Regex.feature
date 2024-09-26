@full
Feature: Working with regex

  Background:
    * url baseURL
    * path 'api/users'

  Scenario: Create new user with regex assertion
    Given request { "name": "Marcin", "job": "QA with id 323264732" }
    When method post
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "#regex QA .*", "id":  "#string", "createdAt":  "#ignore"}
  # to use regex exp we need to put #regex before
