@full
Feature: Scenario Outline
  
  Background:
    * url baseURL
    * path 'api/users'
    * def userResponseGenerator = Java.type('org.example.data_provider.UserResponseGenerator')
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
  
  Scenario Outline: Create new users with dynamic evaluation in scenario outline
    * def TomVariable = 'Tom'
    * print <name>
    * def userRequest = userGenerator.generateUserDto(<name>, job)
    * def userResponse = userResponseGenerator.generateUserResponse(<name>, job)
    
    Given request karate.toJson(userRequest)
    When method POST
    Then status 201
    And print response
    And match $ == karate.toJson(userResponse)
    
    Examples:
      | name                 | job |
      | TomVariable+' Smith' | Dev |
      | 'Mark Wallace'       | PM  |