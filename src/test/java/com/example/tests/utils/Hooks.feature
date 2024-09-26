Feature: Hooks

  Background:
    * configure url = "https://reqres.in/"

  @createUser
  Scenario: create user
    Given path "/api/users"
    When request karate.toJson(requestBody)
    And method post
    Then status 201
