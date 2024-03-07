@full
Feature: Tests which are based on java integration

  Background:
    * url baseURL
    * path 'api/users'
    # java classes
    * def userResponseGenerator = Java.type('org.example.data_provider.UserResponseGenerator')
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def userResponseMapper = Java.type('org.example.mappers.UserResponseMapper')

  Scenario: Create new user and using java generated dto
    * def userRequest = userGenerator.generateUserDto()
    * def userResponse = userResponseGenerator.generateUserResponse()

    Given request karate.toJson(userRequest)
    When method post
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

  Scenario: Convert karate obj to java DTO
    * def requestBody =
    """
    {
      "name": "Marcin",
      "job": "QA"
    }
    """
    * def expectedResponse =
    """
    {
      "name": "Marcin",
      "job":  "QA",
      "id": "#string",
      "createdAt":  "#ignore"
    }
    """

    Given request requestBody
    When method POST
    Then status 201
    And print response
    And match response == expectedResponse
    # converting karate object to java DTO
    And def responseAsJavaObj = userResponseMapper.mapToUserResponse(response)
    And print responseAsJavaObj

  Scenario: Create new user and serialize it to Json
    * def userRequest = userGenerator.generateUserDtoAsJson()

    Given request userRequest
    When method POST
    Then status 201
    And print response