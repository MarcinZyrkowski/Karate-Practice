Feature: Hooks

  Background:
    * configure url = baseURL
    * def JsonMapper = Java.type('com.example.testframework.mapper.JsonMapper')

  @ignore
  @config
  Scenario: config
    * configure url = baseURL
    * def tm = Java.type('com.example.testframework.manager.TestManager').getInstance()
    * def JsonMapper = Java.type('com.example.testframework.mapper.JsonMapper')

  @ignore
  @createUser
  Scenario: create user
    Given path "/api/users"
    When request JSON.parse(JsonMapper.mapToJson(requestBody))
    And method post
    Then status 201
