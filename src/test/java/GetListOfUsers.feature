Feature: Get list of users

  Background:
    * url baseURL
    * path 'api/users?page=2'


  Scenario: Get list of users
    When method GET
    Then status 200