Feature: Get list of users

  Background:
    * url baseURL

  Scenario: Get list of users
    Given path 'api/users'
    And param page = 2
    # query parameter is set using page
    When method GET
    Then status 200
    And print response