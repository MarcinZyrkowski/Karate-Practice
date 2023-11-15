Feature: Create new user

  Background:
    * url baseURL
    * path 'api/users'
    * def userResponseGenerator = Java.type('org.example.data_provider.UserResponseGenerator')
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')

    # we can also combine url and path using ``
    # In JavaScript, the double backticks    (``) are used to define a template literal.
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
    * def userRequest = userGenerator.generateUserDto()

    * def userResponse = userResponseGenerator.generateUserResponse()

    * def req = karate.toJson(userRequest)
    * print req

    * def name = req.name
    * print name
    # how to use fields in json build using JAVA

    Given request req
    When method POST
    Then status 201
    And print response
    And match $ == karate.toJson(userResponse)
    # $ could be used as response

  Scenario Outline: Create new users based on java template requests
    * def userRequest = userGenerator.generateUserDto(name, job)

    * def userResponse = userResponseGenerator.generateUserResponse(name, job)

    Given request karate.toJson(userRequest)
    When method POST
    Then status 201
    And print response
    And match $ == karate.toJson(userResponse)

    Examples:
      | name | job |
      | Tom  | Dev |
      | Mark | PM  |

  Scenario: Create new user with regex assertion
    Given request { "name": "Marcin", "job": "QA with id 323264732" }
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "#regex QA .*", "id":  "#string", "createdAt":  "#ignore"}
    # to use regex exp we need to put #regex before

  Scenario: Create new user using dynamic variable
    * def person = 'Marcin'
    Given request { "name": "#(person)", "job": "QA" }
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}

  Scenario Outline: Create new users with dynamic evaluation in scenario outline
    * def T = 'Tom'
    * print <name>
    * def userRequest = userGenerator.generateUserDto(<name>, job)
    * def userResponse = userResponseGenerator.generateUserResponse(<name>, job)

    Given request karate.toJson(userRequest)
    When method POST
    Then status 201
    And print response
    And match $ == karate.toJson(userResponse)

    Examples:
      | name   | job |
      | T+'X'  | Dev |
      | 'Mark' | PM  |

  Scenario Outline: Removing fields from json
    * def req = karate.toJson(userGenerator.generateUserDto())
    * remove req.<missingField>
    * print req

    Examples:
      | missingField |
      | name         |
      | job          |

  Scenario: Create new user and serialize it to Json
    * def userRequest = userGenerator.generateUserDtoAsJson()

    Given request userRequest
    When method POST
    Then status 201
    And print response

      # TODO add test case with running test scenario with tags and read('@loadData')