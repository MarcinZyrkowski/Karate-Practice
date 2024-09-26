Feature: Hooks

  Background:
    * configure url = "https://reqres.in/"
    * def JsonConverter = Java.type('com.example.testframework.utils.JsonConverter')

  @createUser
  Scenario: create user
    Given path "/api/users"
    When request JSON.parse(JsonConverter.serializePojo(requestBody))
    And method post
    Then status 201
