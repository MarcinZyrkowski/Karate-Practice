Feature: Hooks

  @ignore @hello
  Scenario: setup hook
    When print 'hello'

  @ignore @createUser
  Scenario: create new user
    * url baseURL
    * path 'api/users'
    Given request userRequest
    When method POST
    Then status 201
    And print response