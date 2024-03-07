Feature: Dynamic variable

  Background:
    * url baseURL
    * path 'api/users'

  Scenario: Using dynamic variable
    * def person = 'Marcin'
    Given request { "name": "#(person)", "job": "QA" }
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}