Feature: Get list of users

  Background:
    * url baseURL
    * path 'api/users'
    * param page = 2
    # query parameter is set using page

  Scenario: Get list of users
    When method GET
    Then status 200
    And print response