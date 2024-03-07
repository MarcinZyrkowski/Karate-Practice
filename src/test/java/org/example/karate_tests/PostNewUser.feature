@full
Feature: Create new user

  Background:
    * url baseURL
    * path 'api/users'
    * def userResponseGenerator = Java.type('org.example.data_provider.UserResponseGenerator')
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def userResponseMapper = Java.type('org.example.mappers.UserResponseMapper')

  Scenario: Create new user using dynamic variable
    * def person = 'Marcin'
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

  Scenario: Parse Json string to karate JSON
    * def conv = Java.type('org.example.utils.JsonConverter')
    * def userRequest = userGenerator.generateUserDto()
    * def req = conv.serializePojo(userRequest)
    * print req

    Given request JSON.parse(req)
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}

  Scenario: Convert response to java DTO
    * def person = 'Marcin'
    Given request { "name": "#(person)", "job": "QA" }
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}
    And def responseAsJavaObj = userResponseMapper.mapToUserResponse(response)
    And print responseAsJavaObj
