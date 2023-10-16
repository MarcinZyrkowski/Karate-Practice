Feature: Get list of users

  Background:
    * url 'https://reqres.in/api/users?page=2'


  Scenario: Get list of users
    When method GET
    Then status 200