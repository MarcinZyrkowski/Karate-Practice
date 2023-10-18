Feature: Create new user

  Background:
    * url baseURL
    * path 'api/users'

    # we can also combine url and path using ``
    # In JavaScript, the double backticks (``) are used to define a template literal.
    # Template literals are a way to create strings that can span multiple lines and include expressions
    # or variables directly within the string using ${...} syntax.
    # example: `${baseURL}api/users`

  Scenario: Create new user
    Given request { "name": "Marcin", "job": "QA" }
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}
    # "id": #string means id should be a string, not specified value but a type
    # "#ignore means we ignore whatever is there

  Scenario: Create new user using dynamic variable
    * def person = 'Marcin'
    # In Karate, when you use the #(...) syntax within a string, it is treated as a variable reference
    # or expression that gets evaluated and replaced at runtime. The result of the expression is then used to
    # build the string.
    # #(...) is used to wrap an expression.
    # ${person} is assumed to be a variable or expression.
    Given request { "name": "#(`${person}`)", "job": "QA" }
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}

  Scenario: Create new user and match it with external file
    * def expectedResponse = read('file:src/test/resources/postResponse.json')
    Given request { "name": "Marcin", "job": "QA" }
    When method POST
    Then status 201
    And print response
    And match response == expectedResponse

  Scenario: Create new user and using java generated dto
    * def UserGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def userRequest = UserGenerator.generateUserDto()
    Given request karate.toJson(userRequest)
    When method POST
    Then status 201
    And print response
    And match $ == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}
    # $ could be used as response
